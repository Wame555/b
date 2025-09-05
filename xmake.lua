-- Projekt beállítása
set_project("CryptoBot")
set_version("1.0.0")
set_xmakever("2.7.3")

-- Fordítási beállítások
set_languages("cxx17")
add_rules("mode.debug", "mode.release")

-- Csomagok hozzáadása (automatikus letöltés)
add_requires("qt", {system = false})
add_requires("ixwebsocket", {system = false})
add_requires("nlohmann_json", {system = false})
add_requires("libcurl", {system = false})

-- Fő target
target("CryptoBot")
    set_kind("binary")
    add_files("src/*.cpp")
    add_includedirs("include", {public = true})
    add_packages("qt6", "ixwebsocket", "nlohmann_json", "libcurl")
    add_links("Qt6Widgets", "Qt6Network")
