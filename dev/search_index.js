var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = CoinGeckoAPI","category":"page"},{"location":"#CoinGeckoAPI","page":"Home","title":"CoinGeckoAPI","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for CoinGeckoAPI.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [CoinGeckoAPI]","category":"page"},{"location":"#CoinGeckoAPI._api_url_params","page":"Home","title":"CoinGeckoAPI._api_url_params","text":"_api_url_params(api_url, params, api_url_has_params = false)\n\nFunction to build the API url with the parameters\n\nArguments\n\n`api_url: string` : the API url\n`params: dict` : the parameters to be added to the API url\n`api_url_has_params: bool` : if the API url has parameters\n\nReturns\n\n`api_url: String` : the API url with the parameters\n\n\n\n\n\n","category":"function"},{"location":"#CoinGeckoAPI.get_coin_by_id-Tuple{Any, Vararg{Any}}","page":"Home","title":"CoinGeckoAPI.get_coin_by_id","text":"get_coin_by_id(id, kargs...)\n\nGet current data (name, price, market, including exchange tickers for a coin)\n\nArguments\n\n`id: string` : the coin id \n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coin: Dict` : the current data for a coin\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_coin_history_by_id-Tuple{Any, Any, Vararg{Any}}","page":"Home","title":"CoinGeckoAPI.get_coin_history_by_id","text":"get_coin_history_by_id(id, date, kargs...)\n\nGet Historical data (name, price, market, stats ) at a given date for a coin.\n\nArguments\n\n`id: string` : the coin id \n`date: string` : the date to get the data for\n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coin_history: Dict` : the historical data for a coin\n\nExample:\n\n```julia r = getcoinhistorybyid(\"bitcoin\", \"30-12-2017\")\n\n````\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_coin_market_chart_by_id-Tuple{Any, Any, Any, Vararg{Any}}","page":"Home","title":"CoinGeckoAPI.get_coin_market_chart_by_id","text":"get_coin_market_chart_by_id(id, vs_currency, days, kargs...)\n\nGet historical market data include price, market cap, and 24h volume (granularity auto) Minutely data will be used for duration within 1 day, Hourly data will be used for duration between 1 day and 90 days,      Daily data will be used for duration above 90 days.\n\nArguments\n\n`id: string` : the coin id \n`vs_currency: string` : the currency to get the data in\n`days: String` : the number of days to get the data for\n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coin_market_chart: Dict` : the historical market data for a coin\n\nExample:\n\nr = get_coin_market_chart_by_id(\"bitcoin\", \"usd\", \"30\")\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_coin_market_chart_range_by_id-Tuple{Any, Any, Any, Any, Vararg{Any}}","page":"Home","title":"CoinGeckoAPI.get_coin_market_chart_range_by_id","text":"get_coin_market_chart_range_by_id(id, vs_currency, from_timestamp, to_timestamp, kargs...)\n\nGet historical market data include price, market cap, and 24h volume within a range of timestamp (granularity auto) Data granularity is automatic (cannot be adjusted) 1 day from query time = 5 minute interval data 1 - 90 days from query time = hourly data above 90 days from query time = daily data (00:00 UTC)\n\nArguments\n\n`id: string` : the coin id \n`vs_currency: string` : the currency to get the data in\n`from_timestamp: String` : the timestamp to start the data from (UNIX Timestamp (eg 1392577232))\n`to_timestamp: String` : the timestamp to end the data from (UNIX Timestamp (eg 1422577232))\n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coin_market_chart: Dict` : the historical market data for a coin\n\nExample:\n\nr = get_coin_market_chart_range_by_id(\"bitcoin\", \"usd\", \"1392577232\", \"1422577232\")\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_coin_ohlc_by_id-Tuple{Any, Any, Any}","page":"Home","title":"CoinGeckoAPI.get_coin_ohlc_by_id","text":"get_coin_ohlc_by_id(id, vs_currency, days)\n\nGet coin's ohlc Candles's body:     1-2 days: 30 minutes     3-30 days: 4 hours     31 and before: 4 days\n\nArguments\n\n`id: string` : the coin id  (eg bitcoin)\n`vs_currency: string` : the currency to get the data in\n`days: String` : the number of days to get the data for\n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coin_ohlc: Dict` : the ohlc data for a coin\n\nExample:\n\nr = get_coin_ohlc_by_id(\"bitcoin\", \"usd\", \"30\")\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_coin_status_updates_by_id-Tuple{Any, Vararg{Any}}","page":"Home","title":"CoinGeckoAPI.get_coin_status_updates_by_id","text":"get_coin_status_updates_by_id(id, kargs...)\n\nGet status updates for a given coin.\n\nArguments\n\n`id: string` : the coin id  (eg bitcoin)\n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coin_status_updates: Dict` : the status updates for a coin\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_coin_ticker_by_id-Tuple{Any, Vararg{Any}}","page":"Home","title":"CoinGeckoAPI.get_coin_ticker_by_id","text":"get_coin_ticker_by_id(id, kargs...)\n\nGet coin tickers (paginated to 100 items)\n\nArguments\n\n`id: string` : the coin id \n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coin_ticker: Dict` : the coin tickers\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_coins_list-Tuple","page":"Home","title":"CoinGeckoAPI.get_coins_list","text":"get_coins(kargs...)\n\nList all coins with data (name, price, market, developer, community, etc)\n\nArguments\n\n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coins: Dict` : the list of coins with id, name and symbol\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_coins_markets-Tuple{Any, Vararg{Any}}","page":"Home","title":"CoinGeckoAPI.get_coins_markets","text":"get_coins_markets(vs_currencies, kargs...)\n\nUse this to obtain all the coins market data (price, market cap, volume)\n\nArguments\n\n`vs_currencies: list` : the currencies to get the price in\n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`coins_markets: Dict` : the list of coins with market data\n\nExample:\n\n```julia r = getcoinsmarkets(\"usd\")\n\n````\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_price-Tuple{Any, Any, Vararg{Any}}","page":"Home","title":"CoinGeckoAPI.get_price","text":"get_price(ids, vs_currencies, kargs...)\n\nGet the price of a cryptocurrency in any other supported currencies needed\n\nArguments\n\n`ids: list` : the cryptocurrency ids\n`vs_currencies: list` : the currencies to get the price in\n`kargs: dict` : the parameters to be added to the API url\n\nReturns\n\n`prices: dict` : the prices of the cryptocurrencies in the currencies\n\nExample:\n\nr = get_price(\"bitcoin\", \"usd\", \"include_market_cap\" => \"true\", \"include_24hr_vol\" => \"true\", \"include_24hr_change\" => \"true\")\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.get_supported_vs_currencies-Tuple{}","page":"Home","title":"CoinGeckoAPI.get_supported_vs_currencies","text":"get_supported_vs_currencies()\n\nGet list of supportedvscurrencies\n\nArguments\n\nNone\n\nReturns\n\n`supported_vs_currencies: Dict` : the list of supported_vs_currencies\n\n\n\n\n\n","category":"method"},{"location":"#CoinGeckoAPI.ping-Tuple{}","page":"Home","title":"CoinGeckoAPI.ping","text":"ping()\n\nFunction to check if the API is up and running\n\nArguments\n\nNone\n\nReturns\n\n\n\n\n\n","category":"method"}]
}
