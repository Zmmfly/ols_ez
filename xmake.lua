target("boringssl")
	set_kind("static")
    add_includedirs("src/boringssl/include", {public=true})
    add_includedirs("src/boringssl/crypto/*", {public=true})
    add_includedirs("src/boringssl/decrepit/*", {public=true})
    add_includedirs("src/boringssl/ssl")
    add_includedirs("src/boringssl/third_party/fiat")
    add_includedirs("src/boringssl/tool")
    add_files("src/boringssl/crypto/*.c|*_test.c")
    add_files("src/boringssl/crypto/*/*.c|*_test.c")
    add_files("src/boringssl/decrepit/*/*.c|*_test.c")
    add_files("src/boringssl/ssl/*.c")
    -- add_files("src/boringssl/tool/*.c")