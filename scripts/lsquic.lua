-- includes("boringssl.lua")
add_requires("xxhash")

target("lsquic")
	set_kind("static")
    -- add_deps("boringssl")
    add_packages("xxhash")
    add_includedirs("../src/lsquic/include", {public=true})
    add_includedirs("../src/lsquic/src", {public=true})
    add_includedirs("../src/lsquic/src/liblsquic", {public=true})
    add_includedirs("../src/lsquic/src/liblsquic/ls-qpack", {public=true})
    add_includedirs("../src/lsquic/src/lshpack", {public=true})
    add_includedirs("../src/boringssl/include")
    add_files("../src/lsquic/src/liblsquic/*.c|common_*.c")
    add_files("../src/lsquic/src/liblsquic/ls-qpack/*.c")
    add_files("../src/lsquic/src/lshpack/*.c")
    add_files("../src/lsquic/src/*.c")
    add_files("../src/boringssl/build/crypto/libcrypto.a")
    add_files("../src/boringssl/build/decrepit/libdecrepit.a")
    add_defines("XXH_HEADER_NAME=\"xxhash.h\"")

    on_load(function(target)
        loc = os.iorun("pwd")
        loc = string.gsub( loc,"\r","" )
        loc = string.gsub( loc,"\n","" )
        base = loc .. "/src/lsquic/"
        exec_path = base.."src/liblsquic/gen-verstrs.pl"
        incl_path = base.."include/lsquic.h"
        outf_path = base.."src/lsquic_versions_to_string.c"
        full_comd = exec_path.." "..incl_path.." "..outf_path
        if not os.isfile(outf_path) then
            ret = os.iorun(full_comd)
            print("Generated: "..outf_path)
        end
    end)
