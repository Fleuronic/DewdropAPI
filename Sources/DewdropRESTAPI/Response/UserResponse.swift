// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import protocol DewdropService.UserFields
import protocol DewdropService.UserAuthenticatedFields
import struct Identity.Identifier

// MARK: -
public struct UserResponse<Fields: UserFields & Decodable> {
	public let result: Bool
	public let user: Fields
}

// MARK: -
extension UserResponse: Response {
	public typealias Resource = User
}
