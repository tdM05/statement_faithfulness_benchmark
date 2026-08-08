#!/usr/bin/env python3
"""Extract ProofNet-Verified failure cases into the benchmark storage layout.

Source of truth (the frozen baseline run):
  runs/baseline/original/text-only/gpt-5.3-codex-spark/inputs/PN-NNN.json
  runs/baseline/analysis/taxonomy-comparison.jsonl
  runs/baseline/analysis/original-manual-audit.jsonl

For each item we emit, under items/item_NNN/:
  informal.md             the shared informal statement (verbatim; .md so LaTeX
                          math renders when browsing the repo)
  versions/vNN/
    statement.lean        the sanitized, buildable Lean packet (comment already
                          stripped by the run; imports/opens/theorem/`by sorry`
                          kept verbatim)
    label.json            THE ANSWER KEY. Never materialized into eval workspaces.
                          Minimal: {"gt_label": ...}; unfaithful/sort_of also
                          carry a "reason".

Two versions are extracted per item:
  v01  <- proofnet original Lean  (the failure the judge rubber-stamped)
  v02  <- proofnet verified Lean  (the intended fix)

Labels for these two come from the taxonomy (q2_faithfulness), which labels the
ORIGINAL file. The verified file is the corrected formalization, so it is labeled
faithful UNLESS the run's audits flagged it as a dirty verified file (none of the
32 items here are in that dirty set: PN#10/168/285/337).
"""
import json, os

BASE = "/h/56/taddmao/code/autoform/runs/baseline"
INPUTS = f"{BASE}/original/text-only/gpt-5.3-codex-spark/inputs"
TAXCMP = f"{BASE}/analysis/taxonomy-comparison.jsonl"
OUT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))  # .../proofnet_verified

# 32 confirmed clear_or_likely_spark_miss items from exp1.
IDS = [23,36,57,59,60,71,73,74,85,87,107,108,109,110,131,137,140,157,170,185,
       230,235,236,249,262,281,284,287,288,313,338,349]

# taxonomy q2 relation -> (gt_label, faithfulness_relation)
# q2 labels the ORIGINAL file's relation to the informal statement.
Q2_MAP = {
    "faithful":     ("faithful",   "equivalent"),
    "weaker":       ("unfaithful", "weaker"),
    "stronger":     ("unfaithful", "stronger"),
    "incomparable": ("unfaithful", "incomparable"),
    "nl_ambiguous": ("sort_of",    "nl_ambiguous"),
    "nl_wrong":     ("sort_of",    "nl_wrong"),
}


def load_jsonl_by_index(path):
    d = {}
    for line in open(path):
        line = line.strip()
        if not line:
            continue
        r = json.loads(line)
        idx = r.get("index")
        if idx is None:
            idx = int(r["item_id"].replace("PN#", ""))
        d[idx] = r
    return d


def write_label(path, gt_label, reason):
    """Minimal answer key: {gt_label}; unfaithful/sort_of also carry a reason."""
    label = {"gt_label": gt_label}
    if gt_label in ("unfaithful", "sort_of") and reason:
        label["reason"] = reason
    with open(path, "w") as f:
        json.dump(label, f, indent=2, ensure_ascii=False)


def main():
    tax = load_jsonl_by_index(TAXCMP)

    for i in IDS:
        inp = json.load(open(f"{INPUTS}/PN-{i:03d}.json"))
        t = tax[i]
        q2 = t["taxonomy_row"].get("q2_faithfulness", "")

        item_dir = f"{OUT}/items/item_{i:03d}"
        os.makedirs(f"{item_dir}/versions/v01", exist_ok=True)
        os.makedirs(f"{item_dir}/versions/v02", exist_ok=True)

        # informal statement (.md so LaTeX renders when browsing)
        with open(f"{item_dir}/informal.md", "w") as f:
            f.write(inp["informal_statement"] + "\n")

        gt_label = Q2_MAP.get(q2, ("sort_of", q2))[0]

        # v01: original Lean (the failure case). reason = taxonomy ground-truth why.
        orig_text = inp["original"]["packet_text"]
        with open(f"{item_dir}/versions/v01/statement.lean", "w") as f:
            f.write(orig_text)
        write_label(f"{item_dir}/versions/v01/label.json",
                    gt_label, t["taxonomy_row"].get("reasoning", ""))

        # v02: verified Lean (intended fix). Faithful for all 32 here (none dirty).
        ver_text = inp["verified"]["packet_text"]
        with open(f"{item_dir}/versions/v02/statement.lean", "w") as f:
            f.write(ver_text)
        write_label(f"{item_dir}/versions/v02/label.json", "faithful", None)

    print(f"extracted {len(IDS)} items into {OUT}/items/")


if __name__ == "__main__":
    main()
