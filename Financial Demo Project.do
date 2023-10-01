                                                                   *Financial Data Management*

*Installiing getsymbols*
ssc install getsymbols

**Not neccessary after installing once**


**Getting Financial data from Yahoo Finance for Year (2010-2023), Where AAPL= Apple Inc., ^DJI= Dow Jones Industrial, ^GSPC= S&P 500 **

getsymbols AAPL ^DJI ^GSPC, ya fy(2010)

**Data Cleaning**

drop open_AAPL high_AAPL low_AAPL close_AAPL open__DJI high__DJI low__DJI close__DJI open__GSPC high__GSPC low__GSPC close__GSPC


**tsset manages the time-series settings of a dataset. tsset timevar declares the data in memory to be a time series. This allows you to use Stata's time-series operators and to analyze your data with the ts commands.**

tsset daten

**tsline Time series line graph**

tsline adjclose_AAPL

tsline adjclose__DJI

tsline adjclose__GSPC


                                                                         **Lag Operators**

**generating lag variable**

gen lag_APPL = L.adjclose_AAPL

**when we browse datas we see few gaps between lag_APPL values, to fix that we create trend and drop lag_APPL, the again generate lag_APPL**
gen trend=_n
tsset trend
drop lag_APPL 
gen lag_APPL = L.adjclose_AAPL


*we can also create lag variables for adjclose__DJI and adjclose__GSPC**

gen lag_DJI = L.adjclose__DJI
gen lag_GSPC = L.adjclose__GSPC


                                                                   **Difference Operators**
																   
**Generating Difference variable**

gen Diff_APPL = D.adjclose_AAPL

gen Diff_DJI = D.adjclose__DJI

gen Diff_GSPL = D.adjclose__GSPC

*Magnitute of Difference in line graph*

tsline Diff_APPL

tsline Diff_DJI

tsline Diff_GSPL


                                                              **Simple returns or percentage changes**
															  
**Generating Returns on investment or percentage changes**

gen ret_AAPL = D.adjclose_AAPL/L.adjclose_AAPL

gen ret_DJI = D.adjclose__DJI/L.adjclose__DJI

gen ret_GSPC = D.adjclose__GSPC/L.adjclose__GSPC

*Magnitute of returns in line graph*

tsline ret_AAPL

tsline ret_DJI

tsline ret_GSPC


                                                                  *Browse to see your final dataset*

bro
