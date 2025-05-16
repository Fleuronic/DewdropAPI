// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import DewdropRESTAPI

import struct Dewdrop.User
import struct Identity.Identifier
import struct Catena.IDFields
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
	CollectionEndpoints: DewdropRESTAPI.CollectionEndpoints,
	CollectionSpecifiedFields: CollectionFields & Fields,
	TagEndpoints: DewdropRESTAPI.TagEndpoints,
	FilterEndpoints: DewdropRESTAPI.FilterEndpoints,
	FilterSpecifiedFields: FilterFields & Fields,
	HighlightEndpoints: DewdropRESTAPI.HighlightEndpoints,
	HighlightSpecifiedFields: HighlightFields & Fields,
	HighlightInRaindropSpecifiedFields: HighlightFields & Fields,
	UserEndpoints: DewdropRESTAPI.UserEndpoints,
	UserSpecifiedFields: UserFields & Fields,
	UserAuthenticatedSpecifiedFields: UserAuthenticatedFields & Fields,
	ImportEndpoints: DewdropRESTAPI.ImportEndpoints,
	ImportSpecifiedFields: ImportFields & Fields,
	BackupEndpoints: DewdropRESTAPI.BackupEndpoints,
	BackupSpecifiedFields: BackupFields & Fields
>: @unchecked Sendable {
	let raindropEndpoints: RaindropEndpoints
	let collectionEndpoints: CollectionEndpoints
	let tagEndpoints: TagEndpoints
	let filterEndpoints: FilterEndpoints
	let highlightEndpoints: HighlightEndpoints
	let userEndpoints: UserEndpoints
	let importEndpoints: ImportEndpoints
	let backupEndpoints: BackupEndpoints
}

// MARK: -
public extension API {
	var error: Self.Error.Type { Error.self }

	func specifyingRaindropFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		Fields,
		Fields,
		Fields,
		CollectionEndpoints,
		CollectionSpecifiedFields,
		TagEndpoints,
		FilterEndpoints,
		FilterSpecifiedFields,
		HighlightEndpoints,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		ImportEndpoints,
		ImportSpecifiedFields,
		BackupEndpoints,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collectionEndpoints: collectionEndpoints,
			tagEndpoints: tagEndpoints,
			filterEndpoints: filterEndpoints,
			highlightEndpoints: highlightEndpoints,
			userEndpoints: userEndpoints,
			importEndpoints: importEndpoints,
			backupEndpoints: backupEndpoints
		)
	}

	func specifyingCollectionFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionEndpoints,
		Fields,
		TagEndpoints,
		FilterEndpoints,
		FilterSpecifiedFields,
		HighlightEndpoints,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		ImportEndpoints,
		ImportSpecifiedFields,
		BackupEndpoints,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collectionEndpoints: collectionEndpoints,
			tagEndpoints: tagEndpoints,
			filterEndpoints: filterEndpoints,
			highlightEndpoints: highlightEndpoints,
			userEndpoints: userEndpoints,
			importEndpoints: importEndpoints,
			backupEndpoints: backupEndpoints
		)
	}

	func specifyingFilterFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionEndpoints,
		CollectionSpecifiedFields,
		TagEndpoints,
		FilterEndpoints,
		Fields,
		HighlightEndpoints,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserAuthenticatedSpecifiedFields,
		UserSpecifiedFields,
		ImportEndpoints,
		ImportSpecifiedFields,
		BackupEndpoints,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collectionEndpoints: collectionEndpoints,
			tagEndpoints: tagEndpoints,
			filterEndpoints: filterEndpoints,
			highlightEndpoints: highlightEndpoints,
			userEndpoints: userEndpoints,
			importEndpoints: importEndpoints,
			backupEndpoints: backupEndpoints
		)
	}

	func specifyingHighlightFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionEndpoints,
		CollectionSpecifiedFields,
		TagEndpoints,
		FilterEndpoints,
		FilterSpecifiedFields,
		HighlightEndpoints,
		Fields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		ImportEndpoints,
		ImportSpecifiedFields,
		BackupEndpoints,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collectionEndpoints: collectionEndpoints,
			tagEndpoints: tagEndpoints,
			filterEndpoints: filterEndpoints,
			highlightEndpoints: highlightEndpoints,
			userEndpoints: userEndpoints,
			importEndpoints: importEndpoints,
			backupEndpoints: backupEndpoints
		)
	}

	func specifyingHighlightInRaindropFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionEndpoints,
		CollectionSpecifiedFields,
		TagEndpoints,
		FilterEndpoints,
		FilterSpecifiedFields,
		HighlightEndpoints,
		HighlightSpecifiedFields,
		Fields,
		UserEndpoints,
		UserSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		ImportEndpoints,
		ImportSpecifiedFields,
		BackupEndpoints,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collectionEndpoints: collectionEndpoints,
			tagEndpoints: tagEndpoints,
			filterEndpoints: filterEndpoints,
			highlightEndpoints: highlightEndpoints,
			userEndpoints: userEndpoints,
			importEndpoints: importEndpoints,
			backupEndpoints: backupEndpoints
		)
	}
	
	
	func specifyingUserFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionEndpoints,
		CollectionSpecifiedFields,
		TagEndpoints,
		FilterEndpoints,
		FilterSpecifiedFields,
		HighlightEndpoints,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		Fields,
		Fields,
		ImportEndpoints,
		ImportSpecifiedFields,
		BackupEndpoints,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collectionEndpoints: collectionEndpoints,
			tagEndpoints: tagEndpoints,
			filterEndpoints: filterEndpoints,
			highlightEndpoints: highlightEndpoints,
			userEndpoints: userEndpoints,
			importEndpoints: importEndpoints,
			backupEndpoints: backupEndpoints
		)
	}

	func specifyingImportFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionEndpoints,
		CollectionSpecifiedFields,
		TagEndpoints,
		FilterEndpoints,
		FilterSpecifiedFields,
		HighlightEndpoints,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		ImportEndpoints,
		Fields,
		BackupEndpoints,
		BackupSpecifiedFields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collectionEndpoints: collectionEndpoints,
			tagEndpoints: tagEndpoints,
			filterEndpoints: filterEndpoints,
			highlightEndpoints: highlightEndpoints,
			userEndpoints: userEndpoints,
			importEndpoints: importEndpoints,
			backupEndpoints: backupEndpoints
		)
	}

	func specifyingBackupFields<Fields>(_: Fields.Type) -> API<
		RaindropEndpoints,
		RaindropSpecifiedFields,
		RaindropFetchSpecifiedFields,
		RaindropListSpecifiedFields,
		CollectionEndpoints,
		CollectionSpecifiedFields,
		TagEndpoints,
		FilterEndpoints,
		FilterSpecifiedFields,
		HighlightEndpoints,
		HighlightSpecifiedFields,
		HighlightInRaindropSpecifiedFields,
		UserEndpoints,
		UserSpecifiedFields,
		UserAuthenticatedSpecifiedFields,
		ImportEndpoints,
		ImportSpecifiedFields,
		BackupEndpoints,
		Fields
	> {
		.init(
			raindropEndpoints: raindropEndpoints,
			collectionEndpoints: collectionEndpoints,
			tagEndpoints: tagEndpoints,
			filterEndpoints: filterEndpoints,
			highlightEndpoints: highlightEndpoints,
			userEndpoints: userEndpoints,
			importEndpoints: importEndpoints,
			backupEndpoints: backupEndpoints
		)
	}
}

public extension API<
	RaindropEndpointsAPI,
	RaindropDetails<UserBasicFields, HighlightInRaindropDetails<UserBasicFields>>,
	RaindropDetails<UserBasicFields, HighlightInRaindropDetails<User.IDFields>>,
	RaindropDetails<User.IDFields, HighlightInRaindropDetails<User.IDFields>>,
	CollectionEndpointsAPI,
	CollectionDetails,
	TagEndpointsAPI,
	FilterEndpointsAPI,
	FilterOverviewFields,
	HighlightEndpointsAPI,
	HighlightDetails,
	HighlightInRaindropDetails<UserDetails>,
	UserEndpointsAPI,
	UserDetails,
	UserAuthenticatedDetails,
	ImportEndpointsAPI,
	ImportFolderFields,
	BackupEndpointsAPI,
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
			collectionEndpoints: .init(provider: provider),
			tagEndpoints: .init(provider: provider),
			filterEndpoints: .init(provider: provider),
			highlightEndpoints: .init(provider: provider),
			userEndpoints: .init(provider: provider),
			importEndpoints: .init(provider: provider),
			backupEndpoints: .init(provider: provider)
		)
	}
}

public extension API<
	RaindropEndpointsMock,
	RaindropDetails<UserBasicFields, HighlightInRaindropDetails<UserBasicFields>>,
	RaindropDetails<UserBasicFields, HighlightInRaindropDetails<User.IDFields>>,
	RaindropDetails<User.IDFields, HighlightInRaindropDetails<User.IDFields>>,
	CollectionEndpointsMock,
	CollectionDetails,
	TagEndpointsMock,
	FilterEndpointsMock,
	FilterOverviewFields,
	HighlightEndpointsMock,
	HighlightDetails,
	HighlightInRaindropDetails<UserDetails>,
	UserEndpointsMock,
	UserDetails,
	UserAuthenticatedDetails,
	ImportEndpointsMock,
	ImportFolderFields,
	BackupEndpointsMock,
	BackupDetails
>{
	static var mock: Self {
		self.init(
			raindropEndpoints: .init(),
			collectionEndpoints: .init(),
			tagEndpoints: .init(),
			filterEndpoints: .init(),
			highlightEndpoints: .init(),
			userEndpoints: .init(),
			importEndpoints: .init(),
			backupEndpoints: .init()
		)
	}
}

// MARK: -
extension API: Catenary.API {
	public typealias APIError = DewdropAPI.Error
}
