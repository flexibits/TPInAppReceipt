// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "TPInAppReceipt",
	platforms: [.macOS(.v10_12),
				.iOS(.v10),
				.tvOS(.v10),
				.watchOS("6.2"),
                .visionOS(.v1)],
	
    products: [
        .library(name: "TPInAppReceipt", targets: ["TPInAppReceipt"]),
		.library(name: "TPInAppReceipt-Objc", targets: ["TPInAppReceipt-Objc"]),
    ],
	dependencies: [
		.package(url: "https://github.com/tikhop/ASN1Swift", .upToNextMajor(from: "1.0.0"))
	],
    targets: [
        .target(
            name: "TPInAppReceipt",
			dependencies: ["ASN1Swift"],
			path: "Sources",
			exclude: ["Bundle+Private.swift", "Objc/InAppReceipt+Objc.swift"],
			resources: [.process("AppleIncRootCertificate.cer"), .process("StoreKitTestCertificate.cer")]
		),
		.target(
			name: "TPInAppReceipt-Objc",
			dependencies: ["TPInAppReceipt"],
			path: "Sources/Objc"
		),
		.testTarget(
			name: "TPInAppReceiptTests",
			dependencies: ["TPInAppReceipt"])
	],
	swiftLanguageVersions: [.v5]
)

    
