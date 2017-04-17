library(quantmod)

startDate <- '2010-01-01'  # start of data
endDate <-  '2017-04-01'   # end of data
Sys.setenv(TZ="UTC")       # set time zone

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

getSymbols(symbols, from=startDate, to=endDate)

for(symbol in symbols) {
  x<-get(symbol)
  x<-adjustOHLC(x,symbol.name=symbol)
  x<-to.weekly(x,indexAt='lastof',drop.time=TRUE)
  indexFormat(x)<-'%Y-%m-%d'
  colnames(x)<-gsub("x",symbol,colnames(x))
  assign(symbol,x)
}

save(list=symbols,file="symbols.RData")
