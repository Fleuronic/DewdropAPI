// swift-tools-version:5.10
import PackageDescription

let package = Package(
	name: "DewdropAPI",
	platforms: [
		.iOS(.v13),
		.macOS(.v12),
		.tvOS(.v13),
		.watchOS(.v6),
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
		.package(url: "https://github.com/Fleuronic/AutoCodable", branch: "conditional"),
		.package(url: "https://github.com/Fleuronic/papyrus", branch: "optional-path-parameters")
	],
	targets: [
		.target(
			name: "DewdropAPI",
			dependencies: ["DewdropRESTAPI"]
		),
		.target(
			name: "DewdropRESTAPI",
			dependencies: [
				"DewdropService",
				"AutoCodable",
				.product(name: "Papyrus", package: "papyrus")
			]
		)
	]
)
