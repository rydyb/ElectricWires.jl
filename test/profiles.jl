@testset "CircularProfile" begin

    circ = CircularProfile(diameter = 1u"mm")
    @test circ.diameter == 1u"mm"

    @test_throws AssertionError CircularProfile(diameter = 1u"s")

end

@testset "RectangularProfile" begin

    rect = RectangularProfile(width = 1u"mm", height = 2u"mm")
    @test rect.width == 1u"mm"
    @test rect.height == 2u"mm"

    @test_throws AssertionError RectangularProfile(width = 1u"s", height = 1u"mm")
    @test_throws AssertionError RectangularProfile(width = 1u"mm", height = 1u"s")

end

@testset "RectangularHollowCoreProfile" begin

    recth = RectangularHollowProfile(width = 5u"mm", height = 5u"mm", hole_diameter = 2.7u"mm")
    @test recth.a.width == 5u"mm"
    @test recth.a.height == 5u"mm"
    @test recth.b.diameter == 2.7u"mm"

    @test_throws AssertionError RectangularHollowProfile(
        width = 5u"s",
        height = 5u"mm",
        hole_diameter = 2.7u"mm",
    )
    @test_throws AssertionError RectangularHollowProfile(
        width = 5u"mm",
        height = 5u"s",
        hole_diameter = 2.7u"mm",
    )
    @test_throws AssertionError RectangularHollowProfile(
        width = 5u"mm",
        height = 5u"mm",
        hole_diameter = 2.7u"s",
    )

    @testset "area" begin

        @test area(circ) ≈ 0.7854u"mm^2" rtol = 1e-4
        @test area(rect) == 1u"mm^2"
        @test area(recth) ≈ 19.27u"mm^2" rtol = 1e-2

    end

end
