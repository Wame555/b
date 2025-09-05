-- Projekt
set_project("CryptoBot")
set_version("1.0.0")
set_xmakever("2.7.3")

-- Fordítási beállítások
set_languages("cxx20")
add_rules("mode.debug", "mode.release")

-- ===== Csomagok (VCPKG) =====
-- Qt6 alap (Core/Gui/Widgets/Network, stb.) + eszközök (moc/uic/rcc)
add_requires("vcpkg::qtbase")
add_requires("vcpkg::qttools")

-- A többi, amit használsz
add_requires("ixwebsocket")
add_requires("nlohmann_json")
add_requires("libcurl")

-- ===== Target =====
target("CryptoBot")
    set_kind("binary")

    -- Qt automatikus MOC/UIC/RCC (EZ kell a metaObject hibák ellen)
    add_rules("qt.widgetapp")  -- ha nem GUI, akkor: qt.console

    -- Források: a .h-k is legyenek bent, hogy az AUTOMOC lássa a Q_OBJECT-et
    add_files("src/**.cpp", "src/**.ui", "resources/**.qrc")
    add_headerfiles("include/(**.h)")

    -- Vcpkg csomagok csatolása
    add_packages("vcpkg::qtbase", "vcpkg::qttools")
    add_packages("ixwebsocket", "nlohmann_json", "libcurl")

    -- NE linkelj kézzel Qt libeket, a csomagkezlés intézi!
    -- (tehát töröld a korábbi add_links("QtWidgets", "QtNetwork") sort)
