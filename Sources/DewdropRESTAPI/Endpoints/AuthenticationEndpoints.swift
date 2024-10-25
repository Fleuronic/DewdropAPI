// Copyright © Fleuronic LLC. All rights reserved.

public import Papyrus

public import struct Dewdrop.AccessToken

@API @JSON(decoder: .dewdrop)
public protocol AuthenticationEndpoints {
	@POST("/access_token")
	func getAccessToken(
		client_id: String,
		client_secret: String,
		grant_type: AccessToken.GrantType,
		code: String?,
		refresh_token: String?,
		redirect_uri: String?
	) async throws -> AccessTokenResponse
}
