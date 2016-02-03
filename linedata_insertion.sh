#!/bin/bash

############################################################################################################
# This is a script that helps register railway line data offered by "駅データ.jp"(http://www.ekidata.jp).
# Supported only MySQL, not other RDMS.
############################################################################################################


# Check arguments.
# One argument is needed, a database name.
if [ $# -ne 1 ]; then
	echo "need 1 argument, a database name" 2>&1
	exit 1
fi

# Constant definition
DATABASE=$1
CSVDIR=csvfiles/

# Convert ascii code into utf8.
# CSV files are ascii code just when downloaded.
nkf -w8 --overwrite csvfiles/* && nkf -g csvfiles/* | grep "UTF-8" 2>&1 >/dev/null && echo "conversion into UTF-8 succeeded"

# Get CSV files' name.
# Check whether amazon linux or not (CentOS).
if grep -q "Amazon" /etc/system-release; then
  STATION_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $9}' | grep "station"`
  PREF_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $9}' | grep "pref"`
  LINE_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $9}' | grep "line"`
  JOIN_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $9}' | grep "join"`
  COMPANY_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $9}' | grep "company"`
else 
  STATION_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $10}' | grep "station"`
  PREF_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $10}' | grep "pref"`
  LINE_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $10}' | grep "line"`
  JOIN_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $10}' | grep "join"`
  COMPANY_CSV=`ls -tlr csvfiles/ | awk '{if ( NR>1 ) print $10}' | grep "company"`
fi

# Insert line data into table.
mysql -u $MYSQL_USER -p$MYSQL_PASS $DATABASE -h $MYSQL_HOST -e "load data local infile '${CSVDIR}${STATION_CSV}' into table stations fields terminated by ',' IGNORE 1 LINES;" && echo "insertion of station data succeeded"
mysql -u $MYSQL_USER -p$MYSQL_PASS $DATABASE -h $MYSQL_HOST -e "load data local infile '${CSVDIR}${PREF_CSV}' into table prefectures fields terminated by ',' IGNORE 1 LINES;" && echo "insertion of prefecture data succeeded"
mysql -u $MYSQL_USER -p$MYSQL_PASS $DATABASE -h $MYSQL_HOST -e "load data local infile '${CSVDIR}${LINE_CSV}' into table railway_lines fields terminated by ',' IGNORE 1 LINES;" && echo "insertion of line data succeeded"
mysql -u $MYSQL_USER -p$MYSQL_PASS $DATABASE -h $MYSQL_HOST -e "load data local infile '${CSVDIR}${JOIN_CSV}' into table joins fields terminated by ',' IGNORE 1 LINES;" && echo "insertion of join data succeeded"
mysql -u $MYSQL_USER -p$MYSQL_PASS $DATABASE -h $MYSQL_HOST -e "load data local infile '${CSVDIR}${COMPANY_CSV}' into table railway_companies fields terminated by ',' IGNORE 1 LINES;" && echo "insertion of railway_company data succeeded"
