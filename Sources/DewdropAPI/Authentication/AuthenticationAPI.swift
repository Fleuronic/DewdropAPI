// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.AccessToken
import struct Foundation.URL
import protocol DewdropService.AccessTokenSpec
import protocol Catenary.API
import class PapyrusCore.Provider

import struct DewdropRESTAPI.AuthenticationEndpointsAPI

public extension Authentication {
	struct API: @unchecked Sendable {
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

extension Authentication.API: Catenary.API {
	public typealias Error = DewdropAPI.Error
}

extension Authentication.API: Equatable {
	public static func ==(lhs: Authentication.API, rhs: Authentication.API) -> Bool {
		lhs.clientID == rhs.clientID && lhs.clientSecret == rhs.clientSecret
	}
}

extension Authentication.API: AccessTokenSpec {
	public func exchangeCodeForAccessToken(code: String, redirectingTo uri: URL) async -> Response<AccessToken> {
		await response {
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

	public func refreshAccessToken(_ token: AccessToken) async -> Response<AccessToken> {
		await response {
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
