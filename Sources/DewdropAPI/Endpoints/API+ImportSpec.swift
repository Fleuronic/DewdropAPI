// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.URL
import struct DewdropService.InfoFields
import protocol DewdropService.ImportSpec
import protocol Catenary.API
import protocol Catenary.Parameters

extension API: ImportSpec {
	public func parseInfo(from url: URL) async -> Self.Result<InfoFields> {
		let path = "import/url/parse"
		let parameters = ParseInfoParameters(url: url)
		return await getResource(at: path, with: parameters)
	}
}
