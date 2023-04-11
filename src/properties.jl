export area, resistance, weight, heat_capacity

"""
    area(s::CrossSection)

Returns the area of the given wire cross-section.

# Arguments
- `s::CrossSection`: The wire cross-section.

# Returns
- `Unitful.Area`: The area of the wire cross-section.
"""
area(s::Circular) = π * (s.diameter / 2)^2
area(s::Rectangular) = s.width * s.height
area(s::Difference) = area(s.a) - area(s.b)

"""
    resistance(s::CrossSection; m::Material = Copper)

Returns the resistance of the given wire cross-section assuming copper as the material by default.

# Arguments
- `s::CrossSection`: The wire cross-section.

# Keywords
- `m::Material = Copper`: The material of the wire.

# Returns
- `Unitful.ElectricalResistance`: The resistance of the wire cross-section.
"""
function resistance(s::CrossSection; m::Material = Copper)
    A = area(s)
    ρ = m.resistivity

    return uconvert(u"mΩ/m", ρ / A)
end

"""
    weight(s::CrossSection; m::Material = Copper)

Returns the weight of the given wire cross-section assuming copper as the material by default.

# Arguments
- `s::CrossSection`: The wire cross-section.

# Keywords
- `m::Material = Copper`: The material of the wire.

# Returns
- `Unitful.Mass`: The weight of the wire cross-section.
"""
function weight(s::CrossSection; m::Material = Copper)
    A = area(s)
    ρ = m.density

    return uconvert(u"g/m", ρ * A)
end

"""
    heat_capacity(s::CrossSection; m::Material = Copper)

Returns the heat capacity of the given wire cross-section assuming copper as the material by default.

# Arguments
- `s::CrossSection`: The wire cross-section.

# Keywords
- `m::Material = Copper`: The material of the wire.

# Returns
- `Unitful.SpecificHeatCapacity`: The heat capacity of the wire cross-section.
"""
function heat_capacity(s::CrossSection; m::Material = Copper)
    w = weight(s)
    c = m.heat_capacity

    return uconvert(u"J/(m*K)", c * w)
end