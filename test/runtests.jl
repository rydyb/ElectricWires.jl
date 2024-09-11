using ElectricWires
using Test
using DynamicQuantities

circ = CircularProfile(diameter = 1u"mm")
rect = RectangularProfile(width = 1u"mm", height = 1u"mm")
recth = RectangularHollowProfile(width = 5u"mm", height = 5u"mm", hole_diameter = 2.7u"mm")

include("profiles.jl")
include("materials.jl")
include("wire.jl")
