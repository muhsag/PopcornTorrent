// swift-tools-version:5.4.0
import PackageDescription

let package = Package(
    name: "PopcornTorrent",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12), .tvOS(.v12), .macOS(.v11)
    ],
    products: [
        .library(name: "PopcornTorrent", targets: ["PopcornTorrent"]),
    ],
    dependencies: [
        .package(url: "https://github.com/alextud/GCDWebServer", .branch("swift-package-manager"))
    ],
    targets: [
        .target(
            name: "PopcornTorrent",
            dependencies: ["GCDWebServer"],
            path: "PopcornTorrent/Sources",
            exclude: ["torrent/Makefile.am", "torrent/Makefile.in"],
            cxxSettings: [
                .define("TARGET_OS_IOS", .when(platforms: [.iOS])),
                .define("TARGET_OS_TVOS", .when(platforms: [.tvOS])),
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
        .testTarget(name: "PopcornTorrent-Tests",
                    dependencies: [.targetItem(name: "PopcornTorrent", condition: nil)],
                    path: "PopcornTorrentTests",
                    exclude: ["Test.torrent"]
                    ,linkerSettings: [.linkedFramework("MediaPlayer"), .linkedFramework("SystemConfiguration")]
                   )
    ],
    cLanguageStandard: .gnu99,
    cxxLanguageStandard: .gnucxx11
)
