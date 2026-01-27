import ProjectDescription

let projectSettings: Settings = .settings(
    base: [
        "ENABLE_USER_SCRIPT_SANDBOXING": "YES",
        "ASSETCATALOG_COMPILER_GENERATE_ASSET_SYMBOLS": "YES",
        "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "YES",
    ],
    defaultSettings: .recommended
)

let runLinterTarget: Target = .target(
    name: "RunLinterOnDiff",
    destinations: .iOS,
    product: .staticLibrary,
    productName: "RunLinterOnDiff",
    bundleId: "ChronosControl.RunLinterOnDiff",
    infoPlist: .default,
    sources: ["Sources/**"],
    resources: [],
    scripts: [
        .pre(
            script: """
            REPO_ROOT="$(builtin cd "$WORKSPACE_PATH" && git rev-parse --show-toplevel)"
            "$REPO_ROOT"/Lint/xcode-prebuild-lint
            """,
            name: "Run SwiftLint on diff",
            basedOnDependencyAnalysis: false,
            shellPath: "/bin/bash"
        )
    ],
    dependencies: [],
    settings: nil
)

let project = Project(
    name: "RunLinterOnDiff",
    options: .options(
        automaticSchemesOptions: .disabled
    ),
    settings: projectSettings,
    targets: [
        runLinterTarget
    ],
    schemes: [
        .scheme(
            name: "Run SwiftLint on diff",
            shared: true,
            hidden: false,
            buildAction: .buildAction(targets: ["RunLinterOnDiff"]),
            testAction: nil,
            runAction: nil,
            archiveAction: nil,
            profileAction: nil,
            analyzeAction: nil
        )
    ],
    resourceSynthesizers: []
)
