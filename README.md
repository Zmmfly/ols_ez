# ols_ez
openlitespeed easy build by xmake

# Boringssl compile
`cd src/boringssl && mkdir build && cd build`
`cmake -DCMAKE_BUILD_TYPE=Release .. && make`
If always get a golang timeout err when server in China, please run `go env -w GOPROXY=https://goproxy.cn`

# ModSecurity compile
`cd src/mod_sec`
`./build.sh`

# lsrecaptcha compile
`cd src/ols/src/modules/lsrecaptcha`
`./build_lsrecaptcha.sh`