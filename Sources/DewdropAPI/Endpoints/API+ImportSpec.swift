// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.Raindrop
import struct DewdropService.InfoFields
import struct DewdropService.IDListFields
import struct Foundation.URL
import protocol DewdropService.ImportSpec
import protocol Catena.API
import protocol Catena.Parameters

extension API: ImportSpec {
	public func parseInfo(from url: URL) async -> Self.Result<InfoFields> {
		let path = "import/url/parse"
		let parameters = ParseInfoParameters(url: url)
		return await getResource(at: path, with: parameters)
	}
	
	public func checkExistence(of urls: [URL]) async -> Self.Result<IDListFields<Raindrop.Identified>> {
		let path = "import/url/exists"
		let payload = URLCheckPayload(urls: urls)
		return await post(payload, to: path)
	}
}
