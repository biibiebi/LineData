# LineData
* A script that registers Japanese railway line data offered by "駅データ.jp"(http://www.ekidata.jp).

## Description
* LineData is a CLI tool that helps register line data offered by "駅データ.jp"(http://www.ekidata.jp). It has has a SQL file that shows table definition and a script that inserts line data into tables defined by the file. It has a directory for storing CSV files offered by "駅データ.jp".

## Requirement
Confirmed by the following environment:

* OS: CentOS 6.6, Amazon Linux AMI release 2015.09
* RDMS: MySQL 5.5
* shell: bash

## Usage
* Set environment variables as follows:
  * User     as $MYSQL_USER
  * Password as $MYSQL_PASS
  * Host     as $MYSQL_HOST
* Create tables from linedata.sql.
* Download CSV files from http://www.ekidata.jp (User registration is needed).
* Put them in the directory LineData/csvfiles/
  * Caution! Now CSV files are in LineData/csvfiles/, but they may be old.
* Supposing a database name is SAMPLEDB and you're in the LineData directory, execute the following command:
```
./linedata_insertion.sh SAMPLEDB
```

## Installation
```
$ git clone git@github.com:biibiebi/LineData.git
```

## License
MIT
