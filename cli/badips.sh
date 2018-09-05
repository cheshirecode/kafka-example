#!/usr/bin/env sh
curl -sS https://www.badips.com/get/list/any/2 > /tmp/ips.txt
curl -sS https://lists.blocklist.de/lists/all.txt >> /tmp/ips.txt