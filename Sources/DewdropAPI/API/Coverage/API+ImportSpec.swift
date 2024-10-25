// Copyright © Fleuronic LLC. All rights reserved.

public import struct Foundation.URL
public import struct Dewdrop.Raindrop
public import struct DewdropService.InfoParseFields
public import struct DewdropService.ImportFolderCountFields
public import struct Catena.IDListFields
public import protocol DewdropService.ImportSpec
public import protocol Catena.Scoped
public import protocol Catenary.API

extension API: ImportSpec {
	public func parse(url: URL) async -> Self.Result<InfoParseFields> {
		await result {
			try await`import`.parseURL(urlString: url.absoluteString).item 
		}
	}

	public func importFile(at url: URL, withName filename: String) async -> Self.Result<FileImportFields> {
		await result(transform: FileImportFields.init) {
			try await `import`.parseHTMLImportFile(
				file: .init(
					data: try .init(contentsOf: url),
					name: "import",
					fileName: filename
				)
			)
		}
	}

	public func checkExistence(of urls: [URL]) async -> Self.Result<IDListFields<Raindrop.Identified>> {
		await result {
			try await `import`.checkURLsExistence(urlStrings: urls.map(\.absoluteString)).ids
		}.map(IDListFields.init)
	}
}
