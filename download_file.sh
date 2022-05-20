#!/bin/sh

root="https://chriszheng.science/pua-books/"
curl $root | awk -F\" '{print $2}'
