library(quantmod)

#Data structure that contains stock quote objects
ETF_Data <- new.env()

#Assign dates to set range for stock quotes
sDate <- as.Date("2012-01-01")
eDate <- as.Date("2017-04-01")

#Assign a vector of ticker symbols.
ticker_symbol <- c('QAI','MNA','CPI','FTLS','BTAL','CSLS', # Alternative ETFs
                   'LQD','CLY','VCSH','EMB','EMAG','VWOB', # Bond/Fixed Income
                   'SHY','ZROZ','EDV','HYG','EMHY','HYLB',
                   'BWX','ALD','IAGG','MINT','VRIG','BIL',
                   'MBB','COBO','VMBS','MUB','HYD','VTEB',
                   'PFF','IPFF','CWB','AGG','PCEF','SCHZ',
                   'DBA','CTNN','TAGS','DBC','DPU','BCD', # Commondity
                   'DBB','JJU','UBM','USO','FUE','GLD',
                   'PALL','IAU',
                   'UUP','BZF','FXY', # Currency
                   'AOR', 'YDIV', 'AOA' , # Diversified Portfolio
                   'VTI','IPO','SCHB','TAN','GEX','ICLN', # Equity
                   'VPL','KORU','ITB','XHB','FXI',
                   'KWEB','EWH','GDX','PSAU','XME',
                   'VOX','FONE','XLY','INCO','FDIS',
                   'XLP','BRAQ','FSTA','VWO','SCIF','SCHE',
                   'XLE','KOL','FENY','VGK','DBIT','XLF',
                   'CHIX','FNCL','VEU','AADR','XLI',
                   'BBC','FHLC','CHII','FIDU','XLK',
                   'ARKK','FCOM','XLU','INXX','FUTY',
                   'TBF','FLAT','TAPR', # Inverse
                   'DWT','DNO','SH','DRIP','LABS',
                   'TBT','TMF','UCO','USLV','DZZ' # Leveraged 
                   )
                   
getSymbols(ticker_symbol, env=ETF_Data, from=sDate, to=eDate)

# Extract the Adjusted column from all objects,
# then merge all columns into one object
ETF_Adj_Data <- do.call(merge, eapply(ETF_Data, Ad))

# then extract the monthly endpoints
Monthly_ETF_Adj_Data <- ETF_Adj_Data[endpoints(ETF_Adj_Data,'months')]
Monthly_ETF_Adj_Data
