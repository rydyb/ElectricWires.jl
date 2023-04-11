using ElectricWires
using Test
using Unitful

circ = Circular(diameter = 1u"mm")
rect = Rectangular(width = 1u"mm", height = 1u"mm")
recth = RectangularHollow(width = 5u"mm", height = 5u"mm", hole_diameter = 2.7u"mm")

@testset "area" begin

    @test area(circ) ≈ 0.7854u"mm^2" rtol = 1e-4
    @test area(rect) == 1u"mm^2"
    @test area(recth) ≈ 19.27u"mm^2" rtol = 1e-2

end

@testset "resistance" begin

    @test resistance(circ) ≈ 21.39u"mΩ/m" rtol = 1e-2
    @test resistance(recth) ≈ 0.8716u"mΩ/m" rtol = 1e-2

end

@testset "weight" begin

    @test weight(recth) ≈ 172.70u"g/m" rtol = 1e-2

end

@testset "heat_capacity" begin

    @test heat_capacity(recth) ≈ 66u"J/(K*m)" rtol = 1

end