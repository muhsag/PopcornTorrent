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
                .headerSearchPath("include/23")
            ],
            cxxSettings: [
                .unsafeFlags(["-DBOOST_ASIO_ENABLE_CANCELIO"]),
                .unsafeFlags(["-DBOOST_ASIO_HASH_MAP_BUCKETS=1021"]),
                .unsafeFlags(["-DBOOST_FILESYSTEM_VERSION=3"]),
                .unsafeFlags(["-DWITH_SHIPPED_GEOIP_H"]),
                .unsafeFlags(["-DTORRENT_USE_TOMMATH"]),
                .unsafeFlags(["-DBOOST_ASIO_SEPARATE_COMPILATION"]),
                .unsafeFlags(["-DTORRENT_BUILDING_STATIC"]),
                .headerSearchPath("./include/*"),
                .unsafeFlags(["-I", "./include/"]),
                .unsafeFlags(["-I", "/usr/include/net", "-I", "/usr/include/netinet/"]),
                .unsafeFlags(["-std=c++11"]),
            ]
        ),

    ]
)
