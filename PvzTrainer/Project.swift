import ProjectDescription

let projectSettings: Settings = .settings(
    base: [
        "ENABLE_USER_SCRIPT_SANDBOXING": "YES",
        "ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS": "YES",
        "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "YES",
    ],
    defaultSettings: .recommended
)

let mainAppTarget: Target = .target(
    name: "PvzTrainer",
    destinations: .iOS,
    product: .app,
    productName: "PvzTrainer",
    bundleId: "ChronosControl.PvzTrainer",
    infoPlist: "PvzTrainer/Info.plist",
    sources: ["PvzTrainer/Sources/**"],
    resources: ["PvzTrainer/Resources/**"],
    entitlements: nil,
    dependencies: mainAppDependencies(),
    settings: nil
)
    
    
let project = Project(
    name: "PvzTrainer",
    options: .options(
        automaticSchemesOptions: .disabled
    ),
    settings: projectSettings,
    targets: [
        mainAppTarget
    ],
    schemes: [
        .scheme(
            name: "PvzTrainer App",
            shared: true,
            hidden: false,
            buildAction: .buildAction(targets: ["PvzTrainer"]),
            testAction: nil,
            runAction: nil,
            archiveAction: nil,
            profileAction: nil,
            analyzeAction: nil
        ),
    ],
    resourceSynthesizers: []
)

func mainAppDependencies() -> [TargetDependency] {
    [
        .external(name: "Alamofire")
    ]
}
