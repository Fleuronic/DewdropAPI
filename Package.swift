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
			targets: ["DewdropAPI"]
		),
	],
	dependencies: [
		.package(path: "../DewdropService"),
		.package(url: "https://github.com/Fleuronic/Catena", branch: "main"),
		.package(url: "https://github.com/davidsteppenbeck/URL", branch: "main"),
	],
	targets: [
		.target(
			name: "DewdropAPI",
			dependencies: [
				"DewdropService",
				"Catena",
				"URL"
			]
		),
	]
)
