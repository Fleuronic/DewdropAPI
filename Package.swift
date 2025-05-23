// swift-tools-version:6.0
import PackageDescription

let package = Package(
	name: "DewdropAPI",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
		.tvOS(.v15),
		.watchOS(.v8)
	],
	products: [
		.library(
			name: "DewdropAPI",
			targets: [
				"DewdropAPI",
				"DewdropRESTAPI"
			]
		),
	],
	dependencies: [
		.package(path: "../DewdropService"),
		.package(url: "https://github.com/Fleuronic/Catenary", branch: "main"),
		.package(url: "https://github.com/jordanekay/AutoCodable", branch: "main"),
		.package(url: "https://github.com/jordanekay/papyrus", branch: "main")
	],
	targets: [
		.target(
			name: "DewdropAPI",
			dependencies: [
				"Catenary",
				"DewdropRESTAPI"
			]
		),
		.target(
			name: "DewdropRESTAPI",
			dependencies: [
				"DewdropService",
				"AutoCodable",
				.product(name: "Papyrus", package: "papyrus")
			]
		),
		.testTarget(
			name: "DewdropAPITests",
			dependencies: ["DewdropAPI"],
			resources: [.process("Fixtures")]
		)
	],
	swiftLanguageModes: [.v6]
)
		
for target in package.targets {
	target.swiftSettings = [
		.enableExperimentalFeature("StrictConcurrency")
	]
}
