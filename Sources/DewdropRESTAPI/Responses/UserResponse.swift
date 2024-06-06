// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropService.UserPublicDetailsFields
import struct DewdropService.UserAuthenticatedDetailsFields
import protocol DewdropService.UserFields
import protocol Identity.Identifiable

public typealias UserPublicDetailsResponse = UserResponse<UserPublicDetailsFields>
public typealias UserAuthenticatedDetailsResponse = UserResponse<UserAuthenticatedDetailsFields>

// MARK: -
public struct UserResponse<Fields: UserFields & Decodable> {
	public let result: Bool
	public let user: Fields
}

// MARK: -
extension UserResponse: Response {
	public typealias Item = User
}
