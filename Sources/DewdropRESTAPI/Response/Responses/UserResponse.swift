// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropService.UserPublicFields
import protocol DewdropService.UserFields
import struct Identity.Identifier

public typealias PublicUserResponse = UserResponse<UserPublicFields>

// MARK: -
public struct UserResponse<Fields: UserFields & Decodable> {
	public let result: Bool
	public let user: Fields
}

// MARK: -
extension UserResponse: Response {
	public typealias Item = User
}
