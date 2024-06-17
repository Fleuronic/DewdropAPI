// Copyright © Fleuronic LLC. All rights reserved.

import class PapyrusCore.Provider
import struct Dewdrop.AccessToken
import struct Foundation.URL
import struct DewdropRESTAPI.AuthenticationEndpointsAPI
import protocol DewdropService.TokenSpec

public extension Authentication {
	public struct API {
		private let authentication: AuthenticationEndpointsAPI
		private let clientID: String
		private let clientSecret: String
	}
}

public extension Authentication.API {
	init(
		clientID: String,
		clientSecret: String
	) {
		let url = "https://api.raindrop.io/v1/oauth"
		let provider = Provider(baseURL: url).intercept { request, process in
			let response = try await process(request)
			if let error = response.apiError(validating: false) { throw error }
			return response
		}

		authentication = .init(provider: provider)

		self.clientID = clientID
		self.clientSecret = clientSecret
	}
}

extension Authentication.API: TokenSpec {
	public func exchangeCodeForAccessToken(code: String, redirectingTo uri: URL) async -> Result<AccessToken> {
		await result {
			try await authentication.getAccessToken(
				client_id: clientID,
				client_secret: clientSecret,
				grant_type: .authorizationCode,
				code: code,
				refresh_token: nil,
				redirect_uri: uri.absoluteString
			).item
		}
	}

	public func refreshAccessToken(_ token: AccessToken) async -> Result<AccessToken> {
		await result {
			try await authentication.getAccessToken(
				client_id: clientID,
				client_secret: clientSecret,
				grant_type: .refreshToken,
				code: nil,
				refresh_token: token.refreshToken,
				redirect_uri: nil
			).item
		}
	}
}
