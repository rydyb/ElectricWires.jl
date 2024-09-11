export Wire
export weight, resistance, heat_capacity

"""
    Wire{T}

A wire with a cross-section, material, and length.

# Fields
# - `profile::Profile`: The wire's cross-section.
# - `material::Material{T}`: The material of the wire.
# - `length::T`: The length of the wire.
"""
struct Wire{T<:AbstractQuantity}
    profile::Profile
    material::Material{T}
    length::T

    function Wire(; profile::Profile, material::Material{T}, length::T) where {T}
        @assert dimension(length) == dimension(u"m") "length must have units of length"
        @assert ustrip(length) > 0 "length must be positive"
        new{T}(profile, material, length)
    end
end

weight(w::Wire) = uconvert(us"g", w.length * area(w.profile) * w.material.density)
resistance(w::Wire) = uconvert(us"mΩ", w.length * w.material.resistivity / area(w.profile))
heat_capacity(w::Wire) = uconvert(us"J/K", w.material.heat_capacity * weight(w))
