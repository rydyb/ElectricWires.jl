@testset "Wire" begin

    cw = Wire(
        profile = circ,
        material = Cu,
        length = 1u"m",
    )
    @test cw.profile.diameter == 1u"mm"
    @test cw.material.density == 8.96u"g/cm^3"

    rw = Wire(
        profile = recth,
        material = Cu,
        length = 1u"m",
    )

    @testset "weight" begin
        @test weight(cw) ≈ 7.04u"g" rtol = 1e-2
    end

    @testset "resistance" begin

        @test resistance(cw) ≈ 21.39u"mΩ" rtol = 1e-2
        @test resistance(rw) ≈ 0.8716u"mΩ" rtol = 1e-2

    end

    @testset "heat_capacity" begin

        @test heat_capacity(rw) ≈ 66u"J/K" rtol = 1

    end

end
