library(quantmod)

# load ETFs data
symbols <- c('QAI','MNA','CPI','FTLS','BTAL','CSLS', # Alternative ETFs
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
             'TBT','TMF','UCO','USLV','DZZ' # Leveraged)
             
# get quote from symbol using yahoo finance source
getQuote(symbols, what=yahooQF("Last Trade (Price Only)"))
