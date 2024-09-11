export Profile, CircularProfile, RectangularProfile, DifferenceProfile, RectangularHollowProfile
export area

"""
    Profile

Abstract type for wire cross-sections.
"""
abstract type Profile end

"""
    CircularProfile{T}

A circular wire cross-section.

# Fields
- `diameter::T`: The diameter of the wire.
"""
struct CircularProfile{T<:AbstractQuantity} <: Profile
    diameter::T

    function CircularProfile(; diameter::T) where {T}
        @assert dimension(diameter) == dimension(u"m") "diameter must have units of length"
        @assert ustrip(diameter) > 0 "diameter must be positive"
        new{T}(diameter)
    end
end

"""
    RectangularProfile{T}

A rectangular wire cross-section.

# Fields
- `width::T`: The width of the wire.
- `height::T`: The height of the wire.
"""
struct RectangularProfile{T<:AbstractQuantity} <: Profile
    width::T
    height::T

    function RectangularProfile(; width::T, height::T) where {T}
        @assert dimension(width) == dimension(u"m") "width must have units of length"
        @assert dimension(height) == dimension(u"m") "height must have units of length"
        @assert ustrip(width) > 0 "width must be positive"
        @assert ustrip(height) > 0 "height must be positive"
        new{T}(width, height)
    end
end

"""
    DifferenceProfile{S1,S2}

A difference of two wire cross-sections.

# Fields
- `a::S1`: The first wire cross-section which is subtracted from.
- `b::S2`: The second wire cross-section which is subtracted.
"""
struct DifferenceProfile{S1<:Profile,S2<:Profile} <: Profile
    a::S1
    b::S2
end

RectangularHollowProfile(;
    width::AbstractQuantity,
    height::AbstractQuantity,
    hole_diameter::AbstractQuantity,
) = DifferenceProfile(RectangularProfile(width = width, height = height), CircularProfile(diameter = hole_diameter))

"""
    area(s::CrossSection)

Returns the area of the given wire cross-section.

# Arguments
- `s::Profile`: The wire cross-section.

# Returns
- `Unitful.Area`: The area of the wire cross-section.
"""
area(s::CircularProfile) = π * (s.diameter / 2)^2
area(s::RectangularProfile) = s.width * s.height
area(s::DifferenceProfile) = area(s.a) - area(s.b)
