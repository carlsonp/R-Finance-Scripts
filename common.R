downloadMarketData <- function(USE_CACHED_DATA, symbols) {
  if(!USE_CACHED_DATA) {
    market = NULL
    for (symb in symbols) {
      r = av_get(symbol = symb, av_fun = "TIME_SERIES_DAILY_ADJUSTED", outputsize="full")
      r = as.data.frame(r)
      
      # add the ticker symbol as a column of data
      r$symbol = assets$symbol[i]
      if (is.null(market)) {
        market = r
      } else {
        market = rbind(market, r) # "union" the dataframes vertically
      }
    }
    rm(r)
    saveRDS(market, file = "market.rds")
  } else {
    market = readRDS(file = "market.rds")
  }
  return(market)
}