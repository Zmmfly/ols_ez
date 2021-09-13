target("boringssl")
	set_kind("static")
    add_includedirs("src/boringssl/include", {public=true})
    add_includedirs("src/boringssl/crypto", {public=true})
    add_includedirs("src/boringssl/decrepit", {public=true})
    add_includedirs("src/boringssl/ssl")
    add_includedirs("src/boringssl/third_party/fiat")
    add_includedirs("src/boringssl/tool")

    on_load(function(target)
        -- crypto
        for _, dir in ipairs(os.dirs("src/boringssl/crypto/*")) do
            target:add('includedirs', dir)
        end

        for _, dir in ipairs(os.dirs("src/boringssl/decrepit/*")) do
            target:add('includedirs', dir)
        end
    end)

    add_files("src/boringssl/crypto/**.c|*_test.c")
    add_files("src/boringssl/decrepit/**.c|*_test.c")
    add_files("src/boringssl/ssl/*.cc|*_test.cc|*_test.c")
