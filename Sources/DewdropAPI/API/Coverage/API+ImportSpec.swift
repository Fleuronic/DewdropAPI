// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.InfoParseFields
import struct DewdropService.ImportFolderCountFields
import struct DewdropService.IDListFields
import struct Foundation.URL
import protocol DewdropService.ImportSpec
import protocol Catena.Scoped

extension API: ImportSpec {
	public func parse(url: URL) async -> Self.Result<InfoParseFields> {
		await result {
			try await `import`.parseURL(urlString: url.absoluteString).item 
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
