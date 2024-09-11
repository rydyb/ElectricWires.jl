"""
    Material{T}

A material with a name, resistivity, density, and heat capacity.

# Fields
- `resistivity::AbstractQuantity`: The resistivity of the material.
- `density::AbstractQuantity`: The density of the material.
- `heat_capacity::AbstractQuantity`: The heat capacity of the material.
"""
struct Material{T<:AbstractQuantity}
    resistivity::T
    density::T
    heat_capacity::T

    function Material(; resistivity::T, density::T, heat_capacity::T) where {T}
        @assert dimension(resistivity) == dimension(u"Ω*m") "resistivity must have units of resistance times length"
        @assert dimension(density) == dimension(u"g/cm^3") "density must have units of mass per volume"
        @assert dimension(heat_capacity) == dimension(u"J/(g*K)") "heat capacity must have units of energy per mass per temperature"
        @assert ustrip(heat_capacity) > 0 "heat_capacity must be positive"
        @assert ustrip(resistivity) > 0 "resistivity must be positive"
        @assert ustrip(density) > 0 "density must be positive"
        new{T}(resistivity, density, heat_capacity)
    end
end

export Material
export Cu

"""
    Cu

Cu as instance of `Material` with properties from [Wikipedia][1].

[1]: https://en.wikipedia.org/wiki/Electrical_resistivity_and_conductivity#Resistivity_and_conductivity_of_various_materials
"""
const Cu = Material(;
    resistivity = 1.68e-8u"Ω*m",
    density = 8.96u"g/cm^3",
    heat_capacity = 0.385u"J/(g*K)",
)
