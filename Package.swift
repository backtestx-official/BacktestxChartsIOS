// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "BacktestxCharts",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "BacktestxCharts",
            targets: ["BacktestxCharts"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BacktestxCharts",
            dependencies: [],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)
