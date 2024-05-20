// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropService.UserDetailsFields
import struct DewdropService.UserAuthenticatedFields
import protocol DewdropService.UserFields
import protocol Identity.Identifiable

// public typealias UserAuthenticatedDetailsResponse = UserResponse<UserAuthenticatedFields>
public typealias UserPublicDetailsResponse = UserResponse<UserDetailsFields>

// MARK: -
public struct UserResponse<Fields: UserFields & Decodable> {
	public let result: Bool
	public let user: Fields
}

// MARK: -
extension UserResponse: Response {
	public typealias Item = User
}
