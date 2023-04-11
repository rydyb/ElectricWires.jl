export CrossSection, Difference, Circular, Rectangular, RectangularHollow

"""
    CrossSection

Abstract type for wire cross-sections.
"""
abstract type CrossSection end

"""
    Circular{T}

A circular wire cross-section.

# Fields
- `diameter::T`: The diameter of the wire.
"""
struct Circular{T<:Unitful.Length} <: CrossSection
    diameter::T
end

"""
    Circular(; diameter::Unitful.Length)

Returns a circular wire cross-section with the given diameter.

# Keywords
- `diameter::Unitful.Length`: The diameter of the wire.

# Returns
- `Circular`: A circular wire cross-section.
"""
Circular(; diameter::Unitful.Length) = Circular(diameter)

"""
    Rectangular{T}

A rectangular wire cross-section.

# Fields
- `width::T`: The width of the wire.
- `height::T`: The height of the wire.
"""
struct Rectangular{T<:Unitful.Length} <: CrossSection
    width::T
    height::T
end

"""
    Rectangular(; width::Unitful.Length, height::Unitful.Length)

Returns a rectangular wire cross-section with the given width and height.

# Keywords
- `width::Unitful.Length`: The width of the wire.
- `height::Unitful.Length`: The height of the wire.

# Returns
- `Rectangular`: A rectangular wire cross-section.
"""
Rectangular(; width::Unitful.Length, height::Unitful.Length) = Rectangular(width, height)

"""
    Difference{S1,S2}

A difference of two wire cross-sections.

# Fields
- `a::S1`: The first wire cross-section which is subtracted from.
- `b::S2`: The second wire cross-section which is subtracted.
"""
struct Difference{S1<:CrossSection,S2<:CrossSection} <: CrossSection
    a::S1
    b::S2
end

"""
    RectangularHollow(; kwargs...) -> Difference{Rectangular, Circular}

Returns the difference of a rectangular wire cross-section and a circular wire cross-section with the given width, height, and hole diameter.

# Keywords
- `width::Unitful.Length`: The width of the wire.
- `height::Unitful.Length`: The height of the wire.
- `hole_diameter::Unitful.Length`: The diameter of the hole.

# Returns
- `difference::Difference{Rectangular, Circular}`: The difference representing a rectangular hollow wire cross-section.
"""
RectangularHollow(; width::Unitful.Length, height::Unitful.Length, hole_diameter::Unitful.Length) =
    Difference(Rectangular(width = width, height = height), Circular(diameter = hole_diameter))