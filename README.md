# CoinGeckoAPI

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://gjunqueira-sys.github.io/CoinGeckoAPI.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://gjunqueira-sys.github.io/CoinGeckoAPI.jl/dev)
[![Build Status](https://github.com/gjunqueira-sys/CoinGeckoAPI.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/gjunqueira-sys/CoinGeckoAPI.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/gjunqueira-sys/CoinGeckoAPI.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/gjunqueira-sys/CoinGeckoAPI.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

# Coin Gecko API V3

One of the most powerfull crypto API's out there.
APIs are simple and easy to use, fully documented at the website.

("Coin Gecko API" is a trademark of [CoinGecko](https://www.coingecko.com/en/))

# API Information:

[Coin Gecko API](https://www.coingecko.com/en/api/documentation)


# Julia API 
Implementation follows Python API Implementation as close as possible.

Return type is easy to use Dictionary format, ready for implementation and data analysis.
# Examples:

```julia
using CoinGeckoAPI

r = get_coin_by_id("bitcoin")
```
```julia
r = ping()

JSON3.Object{Base.CodeUnits{UInt8, String}, Vector{UInt64}} with 1 entry:
  :gecko_says => "(V3) To the Moon!"

```

```julia
r = get_price("bitcoin", "usd") |>println

{
   "bitcoin": {
                 "usd": 49228
              }
}
```

# API Documentation:

https://www.coingecko.com/api/docs/v3

## ping

- ping()

## simple

- get_price(ids, vs_currencies, kargs...)


```julia
r = get_price("bitcoin", "usd", "include_market_cap" => "true", "include_24hr_vol" => "true", "include_24hr_change" => "true")
```


- get_token_price(id, contract_addresses, vs_currencies, kargs...)

- get_supported_vs_currencies()

## coins

- get_coins_list(kargs...)

- get_coins_markets(vs_currency, kargs...)

```julia
r = get_coins_markets("usd")

````

- get_coin_by_id(id, kargs...)

- get_coin_ticker_by_id(id, kargs...)

- get_coin_history_by_id(id, date, kargs...)

- get_coin_market_chart_by_id(id, vs_currency, days, kargs...)

- get_coin_market_chart_range_by_id(id, vs_currency, from_timestamp, to_timestamp, kargs...)

```julia
r = get_coin_market_chart_range_by_id("bitcoin", "usd", "1392577232", "1422577232")
```

- get_coin_status_updates_by_id(id, kargs...)

- get_coin_ohlc_by_id(id, vs_currency, days, kargs...)

```julia
r = get_coin_ohlc_by_id("bitcoin", "usd", "30")

81-element JSON3.Array{JSON3.Array, Base.CodeUnits{UInt8, String}, Vector{UInt64}}:
 Union{Float64, Int64}[1637683200000, 57418.05, 57418.05, 57418.05, 57418.05]
 Union{Float64, Int64}[1637697600000, 57070.97, 57588.34, 57070.97, 57542.39]
 Union{Float64, Int64}[1637712000000, 57653.91, 57851.38, 57526.34, 57526.34]
 ⋮
 Union{Float64, Int64}[1640260800000, 48316.72, 48630.74, 48316.72, 48630.74]
 Union{Float64, Int64}[1640275200000, 48644.62, 48871.58, 48644.62, 48770.99]
```







