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


