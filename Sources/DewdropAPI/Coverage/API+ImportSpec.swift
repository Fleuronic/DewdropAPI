// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.InfoFields
import struct DewdropService.FolderFields
import struct DewdropService.IDListFields
import struct Foundation.URL
import protocol DewdropService.ImportSpec
import protocol Identity.Identifiable

extension API: ImportSpec {
	public func parse(url: URL) async -> Result<InfoFields> {
		await result { 
			try await `import`.parseURL(urlString: url.absoluteString).item 
		}
	}

	public func checkExistence(of urls: [URL]) async -> Result<IDListFields<Raindrop.Identified>> {
		await result { 
			try await `import`.checkURLsExistence(urlStrings: urls.map(\.absoluteString)).ids
		}.map(IDListFields.init)
	}
	
	public func importFile(at url: URL, withName filename: String) async -> Result<[FolderFields]> {
		await result { 
			return try await `import`.parseHTMLImportFile(
				file: .init(
					data: try .init(contentsOf: url),
					name: "import",
					fileName: filename
				)
			).items
		}		
	}
}
