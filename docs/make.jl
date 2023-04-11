using Documenter, ElectricWires

makedocs(
    modules = [ElectricWires],
    sitename = "ElectricWires.jl",
    pages = Any[
        "ElectricWires.jl"=>"index.md",
        "API references"=>Any["api/materials.md", "api/cross_sections.md"],
    ],
)

deploydocs(repo = "github.com/ryd-yb/ElectricWires.jl.git")