using CoinGeckoAPI
using Documenter

DocMeta.setdocmeta!(CoinGeckoAPI, :DocTestSetup, :(using CoinGeckoAPI); recursive=true)

makedocs(;
    modules=[CoinGeckoAPI],
    authors="Gil Junqueira",
    repo="https://github.com/gjunqueira-sys/CoinGeckoAPI.jl/blob/{commit}{path}#{line}",
    sitename="CoinGeckoAPI.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gjunqueira-sys.github.io/CoinGeckoAPI.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gjunqueira-sys/CoinGeckoAPI.jl",
    devbranch="master",
)
