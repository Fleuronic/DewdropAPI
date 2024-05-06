// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.InfoFields
import struct DewdropService.ImportFields
import struct DewdropService.IDListFields
import struct Catena.Upload
import struct Foundation.URL
import protocol DewdropService.ImportSpec
import protocol Catena.API
import protocol Catena.PathComponent

extension API: ImportSpec {
	public func parseInfo(from url: URL) async -> Self.Result<InfoFields> {
		await get(/.import, /.url, /.parse) {
			ParseInfoParameters(url: url)
		}
	}
	
	public func parseImport(ofFileAt url: URL, withName filename: String) async -> Self.Result<ImportFields> {
		await post(/.import, /.file, upload: {
			Upload(
				url: url,
				name: "import",
				filename: filename
			)
		})
	}
	
	public func checkExistence(of urls: [URL]) async -> Self.Result<IDListFields<Raindrop.Identified>> {
		await post(/.import, /.url, /.exists) {
			URLCheckPayload(urls: urls)
		}
	}
}

// MARK: -
private enum PathComponents: String, PathComponent {
	case `import`
	case url
	case parse
	case file
	case exists
}

private prefix func /(component: PathComponents) -> PathComponent { component }
