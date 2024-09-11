@testset "Material" begin

    m = Material(density = 8.96u"g/cm^3", resistivity=1u"Ω*m", heat_capacity=1u"J/(g*K)")
    @test m.density == 8.96u"g/cm^3"
    @test m.resistivity == 1u"Ω*m"
    @test m.heat_capacity == 1u"J/(g*K)"

    @test_throws AssertionError Material(density = 8.96u"m/s", resistivity=1u"Ω*m", heat_capacity=1u"J/(g*K)")
    @test_throws AssertionError Material(density = 8.96u"g/cm^3", resistivity=1u"Ω", heat_capacity=1u"J/(g*K)")
    @test_throws AssertionError Material(density = 8.96u"g/cm^3", resistivity=1u"Ω*m", heat_capacity=1u"J/K")

end
