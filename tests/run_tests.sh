#!/bin/sh

SLAPD=/usr/local/libexec/slapd
SLAPADD=/usr/local/sbin/slapadd
MKDIR=/bin/mkdir
RM=/bin/rm
KILL=/bin/kill

$RM -rf openldap-data
$MKDIR openldap-data

$SLAPADD -f slapd.conf < startup.ldif
$SLAPD -F . -f slapd.conf -hldap://localhost:1234 

# slapd should be running now

node alltests.js

# kill slapd
$KILL -15 `cat slapd.pid`