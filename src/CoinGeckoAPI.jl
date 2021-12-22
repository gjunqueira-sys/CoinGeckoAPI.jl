module CoinGeckoAPI

# dependacies

using HTTP
using JSON3

# exports
export ping()
export get_price



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
    `coins: Dict` : the list of coins

"""
function get_coins(kargs...)
    apiurl = "coins/list"
    kwards= Dict(kargs)

    api_url = _api_url_params(apiurl, kwards)
    r =  HTTP.request("GET", url_base * api_url)
    r = String(r.body)
    return JSON3.read(r)
    

end








end
