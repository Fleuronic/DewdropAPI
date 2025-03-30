// Copyright © Fleuronic LLC. All rights reserved.

import Testing

import struct Dewdrop.User
import struct Dewdrop.Account
import struct Dewdrop.Group
import struct Dewdrop.Collection
import struct Dewdrop.Network
import struct DewdropAPI.API
import struct Foundation.URL

struct UserSpecTests {
	@Test func fetchUserID() async throws {
		let api = API.mock.specifyingUserFields(User.IDFields.self)
		api.mockFetchUser(byReturning: .model(.user()))

		let id: User.ID = 789
		let user = try await api.fetchUser(with: id).resource
		#expect(user.id == id)
	}

	@Test func fetchUserDetails() async throws {
		let api = API.mock
		api.mockFetchUser(byReturning: .model(.user()))

		let id: User.ID = 789
		let details = try await api.fetchUser(with: id).resource
		let user = User(
			username: "jordanekay",
			fullName: "Jordan Kay",
			avatarURL: .init(string: "https://raindrop.io/avatars/jordan.jpeg"),
			hasProSubscription: true
		)

		#expect(details.id == id)
		#expect(details.username == user.username)
		#expect(details.fullName == user.fullName)
		#expect(details.avatarURL == user.avatarURL)
		#expect(details.hasProSubscription == user.hasProSubscription)
	}

	@Test func fetchAuthenticatedUserID() async throws {
		let api = API.mock.specifyingUserFields(User.IDFields.self)
		api.mockFetchAuthenticatedUser(byReturning: .model(.user(authenticated: true)))

		let id: User.ID = 789
		let user = try await api.fetchAuthenticatedUser().resource
		#expect(user.id == id)
	}

	@Test func fetchAuthenticatedUserDetails() async throws {
		let api = API.mock
		api.mockFetchAuthenticatedUser(byReturning: .model(.user(authenticated: true)))

		let id: User.ID = 789
		let details = try await api.fetchAuthenticatedUser().resource
		let account = Account(
			user: .init(
				username: "jordanekay",
				fullName: "Jordan Kay",
				avatarURL: .init(string: "https://raindrop.io/avatars/jordan.jpeg"),
				hasProSubscription: true
			),
			email: "jordanekay@mac.com",
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
		
		let collectionIDs: [[Collection.ID]] = [[456]]
		let groups = [
			Group(
				title: "Websites",
				sortIndex: 0,
				isHidden: false
			)
		]
		
		let config = User.Config(
			fontSize: 12,
			fontColor: .sunset,
			brokenLevel: .strict,
			languageCode: "en",
			defaultRaindropSort: .criterion(.creationDate, .reverse),
			defaultCollectionView: .simple
		)

		#expect(details.id == id)
		#expect(details.username == account.username)
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

	@Test func connectSocialNetworkAccount() async throws {
		let api = API.mock
		api.mockConnectSocialNetworkAccount(byReturning: .empty)

		let provider: Network.Provider = .facebook
		try await api.connectSocialNetworkAccount(from: provider).validate()		
	}

	@Test func disconnectSocialNetworkAccount() async throws {
		let api = API.mock
		api.mockDisconnectSocialNetworkAccount(byReturning: .empty)

		let provider: Network.Provider = .facebook
		try await api.disconnectSocialNetworkAccount(from: provider).validate()
	}
}
