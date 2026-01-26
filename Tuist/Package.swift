// swift-tools-version: 5.9
@preconcurrency import PackageDescription

#if TUIST
    @preconcurrency import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [:]
    )
#endif

let package = Package(
    name: "PvzTrainerDependencies",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.11.0"),
    ]
)
