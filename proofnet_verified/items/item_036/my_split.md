"Let $G$ be any group" => "{G : Type*} [Group G]" \
"Prove that" (filler) \
"the map from $G$ to itself defined by $g \mapsto g^{-1}$" => "(hf : f = λ g => g⁻¹)"\
"is a homomorphism" => "(∀ x y : G, f x * f y = f (x*y))" \
"if and only" => "↔"
"$G$ is abelian" => "∀ x y : G, x*y = y*x"