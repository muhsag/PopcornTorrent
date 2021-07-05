// swift-tools-version:5.4.0
import PackageDescription

let package = Package(
    name: "PopcornTorrent",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12), .tvOS(.v12), .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "PopcornTorrent",
            type: .dynamic,
            targets: ["PopcornTorrent"]),
    ],
    dependencies: [
        .package(path: "../GCDWebServer")
    ],
    targets: [
        .target(
            name: "PopcornTorrent",
            dependencies: [],
            path: "PopcornTorrent/Source",
            cSettings: [
                .define("SWIFT_PACKAGE"),
            ],
            cxxSettings: [
                .define("BOOST_ASIO_ENABLE_CANCELIO"),
                .define("BOOST_ASIO_HASH_MAP_BUCKETS", to: "1021"),
                .define("BOOST_FILESYSTEM_VERSION", to: "3"),
                .define("WITH_SHIPPED_GEOIP_H"),
                .define("TORRENT_USE_TOMMATH"),
                .define("BOOST_ASIO_SEPARATE_COMPILATION"),
                .define("TORRENT_BUILDING_STATIC"),
                .headerSearchPath("../../include/"),
            ]
        ),
    ],
    cxxLanguageStandard: .gnucxx11
)
