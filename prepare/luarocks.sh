#!/bin/bash

wget https://luarocks.org/releases/luarocks-3.12.1.tar.gz
tar zxpf luarocks-3.12.1.tar.gz
cd luarocks-3.12.1
./configure && make && sudo make install
