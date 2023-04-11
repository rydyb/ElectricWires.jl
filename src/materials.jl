export Material, Copper

@derived_dimension SpecificHeatCapacity dimension(u"J/(kg*K)")

"""
    Material{T1,T2,T3}

A material with a name, resistivity, density, and heat capacity.

# Fields
- `name::String`: The name of the material.
- `resistivity::T1`: The resistivity of the material.
- `density::T2`: The density of the material.
- `heat_capacity::T3`: The heat capacity of the material.
"""
struct Material{T1<:Unitful.ElectricalResistivity,T2<:Unitful.Density,T3<:SpecificHeatCapacity}
    name::String
    resistivity::T1
    density::T2
    heat_capacity::T3
end

"""
    Copper

Copper as instance of `Material` with properties from [Wikipedia][1].

[1]: https://en.wikipedia.org/wiki/Electrical_resistivity_and_conductivity#Resistivity_and_conductivity_of_various_materials
"""
const Copper = Material("Copper", 1.68e-8u"Ω*m", 8.96u"g/cm^3", 0.385u"J/(g*K)")