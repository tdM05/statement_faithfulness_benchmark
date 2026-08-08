import Lake
open Lake DSL

package «proofnet_verified» where
  -- Faithfulness benchmark dataset. Pinned to the exact versions the
  -- ProofNet-Verified run recorded:
  --   Lean    v4.28.0
  --   Mathlib 8f9d9cff6bd728b17a24e163c9402775d9e6a365

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "8f9d9cff6bd728b17a24e163c9402775d9e6a365"

-- No global lib target: statements are materialized into isolated eval
-- workspaces per item/version. This project exists to pin the toolchain and
-- provide a shared, prebuilt Mathlib cache for those workspaces.
