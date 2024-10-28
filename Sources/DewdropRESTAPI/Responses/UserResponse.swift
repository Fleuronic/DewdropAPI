// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropService.UserPublicDetailsFields
import protocol DewdropService.UserFields
import struct Identity.Identifier

public typealias PublicUserResponse = UserResponse<UserPublicDetailsFields>

// MARK: -
public struct UserResponse<Fields: UserFields & Decodable> {
	public let result: Bool
	public let user: Fields
}

// MARK: -
extension UserResponse: Response {
	public typealias Item = User
}
