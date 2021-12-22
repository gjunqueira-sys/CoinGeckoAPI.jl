using CoinGeckoAPI
using Test


r = ping()

r = get_price("bitcoin", "usd")

@testset "CoinGeckoAPI.jl" begin
    # Write your tests here.
end
