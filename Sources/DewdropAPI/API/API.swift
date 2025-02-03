// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropRESTAPI.RaindropDetails
import struct DewdropRESTAPI.CollectionDetails
import struct DewdropRESTAPI.FilterOverviewFields
import struct DewdropRESTAPI.HighlightDetails
import struct DewdropRESTAPI.HighlightInRaindropDetails
import struct DewdropRESTAPI.UserAuthenticatedDetails
import struct DewdropRESTAPI.UserPublicDetails
import struct DewdropRESTAPI.ImportFolderFields
import struct DewdropRESTAPI.BackupDetails
import struct DewdropRESTAPI.RaindropEndpointsAPI
import struct DewdropRESTAPI.CollectionEndpointsAPI
import struct DewdropRESTAPI.TagEndpointsAPI
import struct DewdropRESTAPI.FilterEndpointsAPI
import struct DewdropRESTAPI.HighlightEndpointsAPI
import struct DewdropRESTAPI.UserEndpointsAPI
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI
import struct Identity.Identifier
import struct Catena.IDFields
import class DewdropRESTAPI.RaindropEndpointsMock
import class DewdropRESTAPI.UserEndpointsMock
import class PapyrusCore.Provider
import protocol DewdropRESTAPI.RaindropEndpoints
import protocol DewdropRESTAPI.UserEndpoints
import protocol DewdropService.RaindropFields
import protocol DewdropService.CollectionFields
import protocol DewdropService.FilterFields
import protocol DewdropService.HighlightFields
import protocol DewdropService.UserFields
import protocol DewdropService.UserAuthenticatedFields
import protocol DewdropService.ImportFields
import protocol DewdropService.BackupFields
import protocol Catenary.API
import protocol Catenary.Fields

public struct API<
	RaindropEndpoints: DewdropRESTAPI.RaindropEndpoints,
	RaindropFetchSpecifiedFields: RaindropFields & Fields,
	RaindropListSpecifiedFields: RaindropFields & Fields,
	RaindropSpecifiedFields: RaindropFields & Fields,
	CollectionSpecifiedFields: CollectionFields & Fields,
	FilterSpecifiedFields: FilterFields & Fields,
	HighlightSpecifiedFields: HighlightFields & Fields,
	HighlightInRaindropSpecifiedFields: HighlightFields & Fields,
	UserEndpoints: DewdropRESTAPI.UserEndpoints,
	UserAuthenticatedSpecifiedFields: UserAuthenticatedFields & Fields,
	UserSpecifiedFields: UserFields & Fields,
	ImportSpecifiedFields: ImportFields & Fields,
	BackupSpecifiedFields: BackupFields & Fields
>: @unchecked Sendable {
	let raindropEndpoints: RaindropEndpoints
	let collections: CollectionEndpointsAPI
	let tags: TagEndpointsAPI
	let filters: FilterEndpointsAPI
	let highlights: HighlightEndpointsAPI
	let userEndpoints: UserEndpoints
	let backups: BackupEndpointsAPI
	let `import`: ImportEndpointsAPI

	private let provider: Provider
}

// MARK: -
public extension API {
	var error: Self.Error.Type { Error.self }

	func specifyingRaindropFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		Fields,
		Fields,
		Fields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields,
		UserSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}

	func specifyingCollectionFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		Fields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields,
		UserSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}

	func specifyingFilterFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		Fields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields,
		UserSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}

	func specifyingHighlightFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		Fields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields,
		UserSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}

	func specifyingHighlightInRaindropFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		Fields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields,
		UserSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}
	
	
	func specifyingUserFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields, // TODO: Switch
		Fields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}

	func specifyingUserAuthenticatedFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		Fields,
		UserSpecifiedFields,
		ImportSpecifiedFields,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}

	func specifyingImportFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields,
		UserSpecifiedFields,
		Fields,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}

	func specifyingBackupFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionSpecifiedFields,
		FilterSpecifiedFields,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields,
		UserSpecifiedFields,
		ImportSpecifiedFields,
		Fields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collections: collections,
			tags: tags,
			filters: filters,
			highlights: highlights,
			userEndpoints: userEndpoints,
			backups: backups,
			import: `import`,
			provider: provider
		)
	}
}

public extension API<
	RaindropEndpointsAPI,
	RaindropDetails<User.IDFields, HighlightInRaindropDetails<User.IDFields>>,
	RaindropDetails<UserPublicDetails, HighlightInRaindropDetails<User.IDFields>>,
	RaindropDetails<UserPublicDetails, HighlightInRaindropDetails<UserPublicDetails>>,
	CollectionDetails,
	FilterOverviewFields,
	HighlightDetails,
	HighlightInRaindropDetails<UserPublicDetails>,
	UserEndpointsAPI,
	UserAuthenticatedDetails,
	UserPublicDetails,
	ImportFolderFields,
	BackupDetails
>{
	init(apiKey: String) {
		let url = "https://api.raindrop.io/rest/v1"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addAuthorization(.bearer(apiKey))
		}.intercept { request, process in
			let response = try await process(request)
			try response.apiError(validating: true).map { throw $0 }
			return response
		}
		
		self.init(
			raindropEndpoints: .init(provider: provider),
			collections: .init(provider: provider),
			tags: .init(provider: provider),
			filters: .init(provider: provider),
			highlights: .init(provider: provider),
			userEndpoints: .init(provider: provider),
			backups: .init(provider: provider),
			import: .init(provider: provider),
			provider: provider
		)
	}
}

public extension API<
	RaindropEndpointsMock,
	RaindropDetails<User.IDFields, HighlightInRaindropDetails<User.IDFields>>,
	RaindropDetails<UserPublicDetails, HighlightInRaindropDetails<User.IDFields>>,
	RaindropDetails<UserPublicDetails, HighlightInRaindropDetails<UserPublicDetails>>,
	CollectionDetails,
	FilterOverviewFields,
	HighlightDetails,
	HighlightInRaindropDetails<UserPublicDetails>,
	UserEndpointsMock,
	UserAuthenticatedDetails,
	UserPublicDetails,
	ImportFolderFields,
	BackupDetails
>{
	static var mock: Self {
		let url = "https://api.raindrop.io/rest/v1"
		let provider = Provider(baseURL: url)

		return self.init(
			raindropEndpoints: .init(),
			collections: .init(provider: provider),
			tags: .init(provider: provider),
			filters: .init(provider: provider),
			highlights: .init(provider: provider),
			userEndpoints: .init(),
			backups: .init(provider: provider),
			import: .init(provider: provider),
			provider: provider
		)
	}
}

// MARK: -
extension API: Catenary.API {
	public typealias APIError = DewdropAPI.Error
}
