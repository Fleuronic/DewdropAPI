// Copyright © Fleuronic LLC. All rights reserved.

import Testing

import struct Dewdrop.User
import struct Dewdrop.Account
import struct Dewdrop.Group
import struct Dewdrop.Collection
import struct DewdropAPI.API
import struct Foundation.URL

struct UserSpecTests {
	@Test func fetchUserID() async throws {
		let api = API.mock.specifyingUserFields(User.IDFields.self)
		api.mockFetchUser()
		
		let user = try await api.fetchUser(with: .valid).resource
		#expect(user.id == .valid)
	}
	
	@Test func fetchAuthenticatedUserID() async throws {
		let api = API.mock.specifyingUserAuthenticatedFields(User.IDFields.self)
		api.mockFetchAuthenticatedUser()
		
		let user = try await api.fetchAuthenticatedUser().resource
		#expect(user.id == .valid)
	}

	@Test func fetchAuthenticatedUserDetails() async throws {
		let api = API.mock
		api.mockFetchAuthenticatedUser()
		
		let details = try await api.fetchAuthenticatedUser().resource
		let account = Account(
			user: .init(
				fullName: "Jordan Kay",
				email: "jordanekay@mac.com",
				avatarURL: .init(string: "https://raindrop.io/avatars/jordan.jpeg"),
				hasProSubscription: true
			),
			hasPassword: true,
			fileStorage: .init(
				usedSpace: 0,
				totalSpace: 100,
				lastCheckpointDate: .distantPast
			),
			registrationDate: .distantPast,
			proSubscriptionExpirationDate: .distantFuture,
			facebook: .init(isEnabled: true),
			twitter: .init(isEnabled: true),
			vkontakte: .init(isEnabled: true),
			google: .init(isEnabled: true),
			dropbox: .init(isEnabled: true),
			gdrive: .init(isEnabled: true)
		)
		
		let collectionIDs: [[Collection.ID]] = [[.valid]]
		let groups = [
			Group(
				title: "Websites",
				sortIndex: 0,
				isHidden: false
			)
		]
		
		let config = User.Config(
			fontSize: 0,
			fontColor: .sunset,
			brokenLevel: .default,
			languageCode: "en",
			defaultRaindropSort: .criterion(.creationDate, .reverse),
			defaultCollectionView: .simple
		)
		
		#expect(details.fullName == account.fullName)
		#expect(details.email == account.email)
		#expect(details.avatarURL == account.avatarURL)
		#expect(details.hasProSubscription == account.hasProSubscription)
		#expect(details.hasPassword == account.hasPassword)
		#expect(details.fileStorage == account.fileStorage)
		#expect(details.registrationDate == account.registrationDate)
		#expect(details.proSubscriptionExpirationDate == account.proSubscriptionExpirationDate)
		#expect(details.facebook == account.facebook)
		#expect(details.twitter == account.twitter)
		#expect(details.vkontakte == account.vkontakte)
		#expect(details.google == account.google)
		#expect(details.dropbox == account.dropbox)
		#expect(details.gdrive == account.gdrive)
		#expect(details.groups.map(\.title) == groups.map(\.title))
		#expect(details.groups.map(\.sortIndex) == groups.map(\.sortIndex))
		#expect(details.groups.map(\.isHidden) == groups.map(\.isHidden))
		#expect(details.groups.map { $0.collections.map(\.id) } == collectionIDs)
		#expect(details.config.fontSize == config.fontSize)
		#expect(details.config.fontColor == config.fontColor)
		#expect(details.config.brokenLevel == config.brokenLevel)
		#expect(details.config.languageCode == config.languageCode)
		#expect(details.config.defaultRaindropSort == config.defaultRaindropSort)
		#expect(details.config.defaultCollectionView == config.defaultCollectionView)
	}
}
