// swift-tools-version:5.9
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
		.package(url: "https://github.com/Fleuronic/DewdropService", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Caesura", branch: "main"),
		.package(url: "https://github.com/davidsteppenbeck/URL", branch: "main"),
	],
	targets: [
		.target(
			name: "DewdropAPI",
			dependencies: [
				"DewdropService",
				"Caesura",
				"URL"
			]
		),
	]
)
