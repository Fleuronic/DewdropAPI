//
//  File.swift
//  DewdropAPI
//
//  Created by Jordan Kay on 2/1/25.
//

import struct DewdropAPI.API
import struct Foundation.URL
import struct Foundation.Data
import class Foundation.Bundle
import class DewdropRESTAPI.DewdropDecoder
import protocol DewdropRESTAPI.Response
import typealias DewdropRESTAPI.RaindropResponse

public extension API {
	func response<T: DewdropRESTAPI.Response>(returnedFromPath path: String) throws -> T {
		let url = Bundle.module.url(forResource: path, withExtension: "json")!
		let data = try Data(contentsOf: url)
		let response = Response(body: data)
		let error = response.apiError(validating: false)

		return try error.map { throw $0 } ?? DewdropDecoder().decode(T.self, from: data)
	}
}
