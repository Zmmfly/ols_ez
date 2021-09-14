target("udns")
    set_kind("static")
    add_includedirs("../src/udns", {public=true})
    add_files("../src/udns/*.c")