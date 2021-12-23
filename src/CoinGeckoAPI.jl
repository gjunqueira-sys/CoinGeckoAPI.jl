module CoinGeckoAPI

# dependacies

using HTTP
using JSON3

# exports
export ping
export get_price
export get_token_price
export get_supported_vs_currencies
export get_coins_list
export get_coins_markets
export get_coin_by_id
export get_coin_ticker_by_id
export get_coin_history_by_id
export get_coin_market_chart_by_id
export get_coin_market_chart_range_by_id
export get_coin_status_updates_by_id
export get_coin_ohlc_by_id
export get_coin_info_from_contract_address_by_id
export get_coin_market_chart_from_contract_address_by_id
export get_coin_market_chart_range_from_contract_address_by_id








# globals constants
const global url_base = "https://api.coingecko.com/api/v3/"




"""
    ping()
Function to check if the API is up and running

# Arguments
    None

# Returns
"""
function ping()
    apiurl ="ping"
    r =  HTTP.request("GET", url_base * apiurl)
    r = String(r.body)
    return JSON3.read(r)

end



"""
    _api_url_params(api_url, params, api_url_has_params = false)

Function to build the API url with the parameters

# Arguments
    `api_url: string` : the API url
    `params: dict` : the parameters to be added to the API url
    `api_url_has_params: bool` : if the API url has parameters
       

# Returns
    `api_url: String` : the API url with the parameters
        
"""
function _api_url_params(api_url, params, api_url_has_params = false)
    
    if api_url_has_params == true
        api_url = api_url * "&"
    else
        api_url = api_url * "?"
    end

    for a_pair in params
        api_url *=  a_pair.first * "=" * a_pair.second * "&"
    end
    @show api_url[1:end-1]
    return api_url[1:end-1]
end




"""
    get_price(ids, vs_currencies, kargs...)

Get the price of a cryptocurrency in any other supported currencies needed

# Arguments
    `ids: list` : the cryptocurrency ids
    `vs_currencies: list` : the currencies to get the price in
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `prices: dict` : the prices of the cryptocurrencies in the currencies

# Example:

```julia
r = get_price("bitcoin", "usd", "include_market_cap" => "true", "include_24hr_vol" => "true", "include_24hr_change" => "true")
```


"""
function get_price(ids, vs_currencies, kargs...)
    apiurl = "simple/price"
    kwards= Dict(kargs)
    kwards["ids"] = ids
    kwards["vs_currencies"] = vs_currencies

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    

end




function get_token_price(id, contract_addresses, vs_currencies, kargs...)
    apiurl = "simple/token_price"
    kwards= Dict(kargs)
    kwards["id"] = id
    kwards["contract_addresses"] = contract_addresses
    kwards["vs_currencies"] = vs_currencies

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    

end





"""
    get_supported_vs_currencies()

Get list of supported_vs_currencies

# Arguments
    None

# Returns
    `supported_vs_currencies: Dict` : the list of supported_vs_currencies
"""
function get_supported_vs_currencies()
    apiurl = "simple/supported_vs_currencies"
    r =  HTTP.request("GET", url_base * apiurl)
    r = String(r.body)
    return JSON3.read(r)
    

end



"""
    get_coins(kargs...)

List all coins with data (name, price, market, developer, community, etc)

# Arguments
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coins: Dict` : the list of coins with id, name and symbol

"""
function get_coins_list(kargs...)
    apiurl = "coins/list"
    kwards= Dict(kargs)

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    

end


"""
    get_coins_markets(vs_currencies, kargs...)

Use this to obtain all the coins market data (price, market cap, volume)

# Arguments
    `vs_currencies: list` : the currencies to get the price in
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coins_markets: Dict` : the list of coins with market data

# Example:

```julia
r = get_coins_markets("usd")

````
"""
function get_coins_markets(vs_currency, kargs...)
    apiurl = "coins/markets"
    kwards= Dict(kargs)
    kwards["vs_currency"] = vs_currency

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end


"""
    get_coin_by_id(id, kargs...)

Get current data (name, price, market, including exchange tickers for a coin)

# Arguments
    `id: string` : the coin id 
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coin: Dict` : the current data for a coin

"""
function get_coin_by_id(id, kargs...)
    apiurl = "coins"
    kwards= Dict(kargs)
    kwards["id"] = id

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end




"""
    get_coin_ticker_by_id(id, kargs...)

Get coin tickers (paginated to 100 items)

# Arguments
    `id: string` : the coin id 
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coin_ticker: Dict` : the coin tickers


"""
function get_coin_ticker_by_id(id, kargs...)
    apiurl = "coins/$id/tickers"
    kwards= Dict(kargs)
    kwards["id"] = id

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end




"""
    get_coin_history_by_id(id, date, kargs...) 

Get Historical data (name, price, market, stats ) at a given date for a coin.

# Arguments
    `id: string` : the coin id 
    `date: string` : the date to get the data for
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coin_history: Dict` : the historical data for a coin

# Example:
```julia
r = get_coin_history_by_id("bitcoin", "30-12-2017")

````
"""
function get_coin_history_by_id(id, date, kargs...)
    apiurl = "coins/$id/history"
    kwards= Dict(kargs)
    kwards["id"] = id
    kwards["date"] = date

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end





"""
    get_coin_market_chart_by_id(id, vs_currency, days, kargs...)

Get historical market data include price, market cap, and 24h volume (granularity auto)
Minutely data will be used for duration within 1 day, Hourly data will be used for duration between 1 day and 90 days, 
    Daily data will be used for duration above 90 days.

# Arguments
    `id: string` : the coin id 
    `vs_currency: string` : the currency to get the data in
    `days: String` : the number of days to get the data for
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coin_market_chart: Dict` : the historical market data for a coin

# Example:
```julia
r = get_coin_market_chart_by_id("bitcoin", "usd", "30")
```

"""
function get_coin_market_chart_by_id(id, vs_currency, days, kargs...)
    apiurl = "coins/$id/market_chart"
    kwards= Dict(kargs)
    kwards["id"] = id
    kwards["vs_currency"] = vs_currency
    kwards["days"] = days

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end



"""
    get_coin_market_chart_range_by_id(id, vs_currency, from_timestamp, to_timestamp, kargs...)

Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto)
Data granularity is automatic (cannot be adjusted)
1 day from query time = 5 minute interval data
1 - 90 days from query time = hourly data
above 90 days from query time = daily data (00:00 UTC)

# Arguments
    `id: string` : the coin id 
    `vs_currency: string` : the currency to get the data in
    `from_timestamp: String` : the timestamp to start the data from (UNIX Timestamp (eg 1392577232))
    `to_timestamp: String` : the timestamp to end the data from (UNIX Timestamp (eg 1422577232))
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coin_market_chart: Dict` : the historical market data for a coin

# Example:
```julia
r = get_coin_market_chart_range_by_id("bitcoin", "usd", "1392577232", "1422577232")
```
"""
function get_coin_market_chart_range_by_id(id, vs_currency, from_timestamp, to_timestamp, kargs...)
    apiurl = "coins/$id/market_chart/range"
    kwards= Dict(kargs)
    # kwards["id"] = id
    kwards["vs_currency"] = vs_currency
    kwards["from"] = from_timestamp
    kwards["to"] = to_timestamp

    api_url = _api_url_params(apiurl, kwards)
    
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end
    
    
"""
    get_coin_status_updates_by_id(id, kargs...)

Get status updates for a given coin.

# Arguments
    `id: string` : the coin id  (eg bitcoin)
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coin_status_updates: Dict` : the status updates for a coin

"""
function get_coin_status_updates_by_id(id, kargs...)
    apiurl = "coins/$id/status_updates"
    kwards= Dict(kargs)
    kwards["id"] = id

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end

"""
    get_coin_ohlc_by_id(id, vs_currency, days)

Get coin's ohlc
Candles's body:
    1-2 days: 30 minutes
    3-30 days: 4 hours
    31 and before: 4 days

# Arguments
    `id: string` : the coin id  (eg bitcoin)
    `vs_currency: string` : the currency to get the data in
    `days: String` : the number of days to get the data for
    `kargs: dict` : the parameters to be added to the API url

# Returns
    `coin_ohlc: Dict` : the ohlc data for a coin

# Example:
```julia
r = get_coin_ohlc_by_id("bitcoin", "usd", "30")
```
"""
function get_coin_ohlc_by_id(id, vs_currency, days)
    apiurl = "coins/$id/ohlc"
    kwards= Dict()
    kwards["vs_currency"] = vs_currency
    kwards["days"] = days

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end


"""
    get_coin_info_from_contract_address_by_id(id, contract_address)

Get coin info from contract address

# Arguments
    `id: string` : Asset platform (See asset_platforms endpoint for list of options)
    `contract_address: string` : the token's contract address
    
# Returns
    `coin_info: Dict` : the coin info from contract address

# Example:
```julia
get_coin_info_from_contract_address_by_id("ethereum", "0xc00e94cb662c3520282e6f5717214004a7f26888")
```

"""
function get_coin_info_from_contract_address_by_id(id, contract_address)
    apiurl = "coins/$id/contract/$contract_address"
    kwards= Dict()

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end




"""
    get_coin_market_chart_from_contract_address_by_id(id, contract_address, vs_currency, days)

Get historical market data include price, market cap and 24h volume (granularity auto)

# Arguments
    `id: string` : The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
    `contract_address: string` : Token's contract address
    `vs_currency: string` : the currency to get the data in
    `days: String` : Data up to number of days ago (eg. 1,14,30,max)

# Returns
    `coin_market_chart: Dict` : the historical market data for a coin

# Example:
```julia
r = get_coin_market_chart_from_contract_address_by_id("ethereum", "0xc00e94cb662c3520282e6f5717214004a7f26888", "usd", "1")
```
"""
function get_coin_market_chart_from_contract_address_by_id(id, contract_address, vs_currency, days)
    apiurl = "coins/$id/contract/$contract_address/market_chart"
    kwards= Dict()
    kwards["vs_currency"] = vs_currency
    kwards["days"] = days

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end




"""
    get_coin_market_chart_range_from_contract_address_by_id(id, contract_address, vs_currency, from_timestamp, to_timestamp)

Get historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto)

# Arguments
    `id: string` : The id of the platform issuing tokens (See asset_platforms endpoint for list of options)
    `contract_address: string` : Token's contract address
    `vs_currency: string` : the currency to get the data in
    `from_timestamp: String` : From date in UNIX Timestamp (eg. 1392577232)
    `to_timestamp: String` : To date in UNIX Timestamp (eg. 1422577232)

# Returns
    `coin_market_chart: Dict` : the historical market data for a coin

"""
function get_coin_market_chart_range_from_contract_address_by_id(id, contract_address, vs_currency, from_timestamp, to_timestamp)
    apiurl = "coins/$id/contract/$contract_address/market_chart/range"
    kwards= Dict()
    kwards["vs_currency"] = vs_currency
    kwards["from"] = from_timestamp
    kwards["to"] = to_timestamp

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    
end




end
