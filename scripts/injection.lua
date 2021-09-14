target("injection")
    set_kind("static")
    add_includedirs("../src/libinjection/src", {public=true})
    add_files("../src/libinjection/src/*.c|test*.c|example*.c")