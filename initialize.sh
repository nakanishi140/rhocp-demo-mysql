#!/bin/bash


mysql -u root -pmysql -h localhost demo < alter.sql
mysql -u demo -pmysql -h localhost demo < data.sql
