# !/bin/sh

filter_data="""
"TradingDay"
"SettlementGroupID"
"SettlementID"
"PreSettlementPrice"
"PreClosePrice"
"PreOpenInterest"
"PreDelta"
"BidPrice2"
"BidVolume2"
"BidPrice3"
"BidVolume3"
"AskPrice2"
"AskVolume2"
"AskPrice3"
"AskVolume3"
"BidPrice4"
"BidVolume4"
"BidPrice5"
"BidVolume5"
"AskPrice4"
"AskVolume4"
"AskPrice5"
"AskVolume5"
"""

#echo $filter_data

tmp1_file=tmp1.data
tmp2_file=tmp2.data

# fm8 tcp
fm8_file=mobile_data_1016/fm8_tcp_md_v1_01.data
cp $fm8_file $tmp1_file

for data in $filter_data
do
    grep -v $data $tmp1_file > $tmp2_file
    cp $tmp2_file $tmp1_file
done

cp $tmp2_file tcp_md.data

# xele_net
xele_file=xele_data_1016/xele_net_md.data
cp $xele_file $tmp1_file

for data in $filter_data
do
    grep -v $data $tmp1_file > $tmp2_file
    cp $tmp2_file $tmp1_file
done

cp $tmp2_file xele_md.data

# clean tmp files
rm $tmp1_file $tmp2_file


#grep -v TradingDay fm8_tcp_md_v1_01.data | grep -v SettlementGroupID | grep -v SettlementID | grep -v PreSettlementPrice | grep -v PreClosePrice | grep -v PreOpenInterest | grep -v PreDelta > tcp_md.data 

#grep -v TradingDay xele_net_md.data | grep -v SettlementGroupID | grep -v SettlementID | grep -v PreSettlementPrice | grep -v PreClosePrice | grep -v PreOpenInterest | grep -v PreDelta > xele_md.data 

diff tcp_md.data xele_md.data

