using Documenter, Wires

makedocs(
    modules = [Wires],
    sitename = "Wires.jl",
    pages = Any[
        "Wires.jl"=>"index.md",
        "API references"=>Any["api/materials.md", "api/cross_sections.md"],
    ],
)

deploydocs(repo = "github.com/ryd-yb/Wires.jl.git")