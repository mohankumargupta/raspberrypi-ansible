#!/bin/bash
cd / tmp
wget "https://julialang-s3.julialang.org/bin/linux/arm/0.6/julia-0.6.0-linux-arm.tar.gz" - O julia.tar.gz
mkdir julia tar xvzf julia.tar.gz - C julia --strip-components=1
