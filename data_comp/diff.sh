# !/bin/sh

grep -v TradingDay fm8_tcp_md_v1_01.data | grep -v SettlementGroupID | grep -v SettlementID | grep -v PreSettlementPrice | grep -v PreClosePrice | grep -v PreOpenInterest | grep -v PreDelta > tcp_md.data 

grep -v TradingDay fm8_tcp_md_v1_01.data | grep -v SettlementGroupID | grep -v SettlementID | grep -v PreSettlementPrice | grep -v PreClosePrice | grep -v PreOpenInterest | grep -v PreDelta > xele_md.data 

diff tcp_md.data xele_md.data

