#!/bin/bash


mysql -u root < alter.sql
mysql -u demo -pmysql -h localhost demo < data.sql
