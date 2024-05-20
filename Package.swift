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
		.package(path: "../../../Catena"),
		.package(url: "https://github.com/Fleuronic/AutoCodable", branch: "conditional"),
		.package(path: "../../../papyrus")
	],
	targets: [
		.target(
			name: "DewdropAPI",
			dependencies: [
				"DewdropRESTAPI",
				"Catena"
			]
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
