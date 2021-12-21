module CoinGeckoAPI

# dependacies

using HTTP
using JSON3


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


end
