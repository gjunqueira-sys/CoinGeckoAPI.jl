using CoinGeckoAPI
using Test


r = ping();

r = get_price("bitcoin", "usd");

@testset "CoinGeckoAPI.jl" begin
    # Write your tests here.

    @test 1 ==  1;

    @test ping()["gecko_says"] == "(V3) To the Moon!"

    @test get_price("bitcoin", "usd")["bitcoin"][:usd] |> typeof == Int64 ; # check if price is a number (whatever that is)

    




end
