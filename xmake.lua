-- Projekt beállítása
set_project("CryptoBot")
set_version("1.0.0")
set_xmakever("2.7.3")

-- Fordítási beállítások
set_languages("cxx17")
add_rules("mode.debug", "mode.release")

-- Qt6 útvonala manuális beállítása
set_env("QT6_DIR", "C:/Qt/6.9.2/msvc2022_64")  -- Cseréld le a saját Qt6 útvonaldra!

-- Csomagok hozzáadása (automatikus letöltés)
add_requires("ixwebsocket", {system = false})
add_requires("nlohmann_json", {system = false})
add_requires("libcurl", {system = false})

-- Fő target
target("CryptoBot")
    set_kind("binary")
    add_files("src/*.cpp")
    add_includedirs("include", {public = true})
    add_packages("ixwebsocket", "nlohmann_json", "libcurl")
    add_links("Qt6Widgets", "Qt6Network")
    add_linkdirs("$env(QT6_DIR)/lib")
    add_includedirs("$env(QT6_DIR)/include")
