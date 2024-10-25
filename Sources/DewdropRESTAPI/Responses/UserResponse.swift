// Copyright © Fleuronic LLC. All rights reserved.

public import struct Dewdrop.User
public import struct DewdropService.UserPublicDetailsFields
public import protocol DewdropService.UserFields
public import struct Identity.Identifier

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
