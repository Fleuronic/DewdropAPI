// Copyright © Fleuronic LLC. All rights reserved.

import struct Dewdrop.User
import struct DewdropRESTAPI.RaindropDetails
import struct DewdropRESTAPI.RaindropHighlightDetails
import struct DewdropRESTAPI.CollectionDetails
import struct DewdropRESTAPI.FilterOverviewFields
import struct DewdropRESTAPI.HighlightDetails
import struct DewdropRESTAPI.UserAuthenticatedDetails
import struct DewdropRESTAPI.UserPublicDetails
import struct DewdropRESTAPI.ImportFolderFields
import struct DewdropRESTAPI.RaindropEndpointsAPI
import struct DewdropRESTAPI.CollectionEndpointsAPI
import struct DewdropRESTAPI.TagEndpointsAPI
import struct DewdropRESTAPI.FilterEndpointsAPI
import struct DewdropRESTAPI.HighlightEndpointsAPI
import struct DewdropRESTAPI.UserEndpointsAPI
import struct DewdropRESTAPI.BackupEndpointsAPI
import struct DewdropRESTAPI.ImportEndpointsAPI
import struct Identity.Identifier
import class PapyrusCore.Provider
import protocol DewdropService.RaindropFields
import protocol DewdropService.CollectionFields
import protocol DewdropService.FilterFields
import protocol DewdropService.HighlightFields
import protocol DewdropService.UserFields
import protocol DewdropService.UserAuthenticatedFields
import protocol DewdropService.ImportFields
import protocol Catenary.API

public struct API<
	RaindropResultFields: RaindropFields & Decodable,
	RaindropCreationResultFields: RaindropFields & Decodable,
	RaindropHighlightResultFields: RaindropFields & Decodable,
	CollectionResultFields: CollectionFields & Decodable,
	FilterResultFields: FilterFields & Decodable,
	HighlightResultFields: HighlightFields & Decodable,
	UserAuthenticatedResultFields: UserAuthenticatedFields & Decodable,
	UserPublicResultFields: UserFields & Decodable,
	UserUpdateResultFields: UserFields & Decodable,
	ImportResultFields: ImportFields & Decodable
>: @unchecked Sendable {
	let raindrops: RaindropEndpointsAPI
	let collections: CollectionEndpointsAPI
	let tags: TagEndpointsAPI
	let filters: FilterEndpointsAPI
	let highlights: HighlightEndpointsAPI
	let users: UserEndpointsAPI
	let backups: BackupEndpointsAPI
	let `import`: ImportEndpointsAPI

	private let provider: Provider
}

// MARK: -
public extension API {
	func raindropResultFields<Fields: RaindropFields & Decodable>(_: Fields.Type) -> API<
		Fields,
		RaindropCreationResultFields,
		RaindropHighlightResultFields,
		CollectionResultFields,
		FilterResultFields,
		HighlightResultFields,
		UserAuthenticatedResultFields,
		UserPublicResultFields,
		UserUpdateResultFields,
		ImportResultFields
	> { .init(provider: provider) }

	func raindropCreationResultFields<Fields: RaindropFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		Fields,
		RaindropHighlightResultFields,
		CollectionResultFields,
		FilterResultFields,
		HighlightResultFields,
		UserAuthenticatedResultFields,
		UserPublicResultFields,
		UserUpdateResultFields,
		ImportResultFields
	> { .init(provider: provider) }

	func raindropHighlightResultFields<Fields: RaindropFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		RaindropCreationResultFields,
		Fields,
		CollectionResultFields,
		FilterResultFields,
		HighlightResultFields,
		UserAuthenticatedResultFields,
		UserPublicResultFields,
		UserUpdateResultFields,
		ImportResultFields
	> { .init(provider: provider) }

	func collectionResultFields<Fields: CollectionFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		RaindropCreationResultFields,
		RaindropHighlightResultFields,
		Fields,
		FilterResultFields,
		HighlightResultFields,
		UserAuthenticatedResultFields,
		UserPublicResultFields,
		UserUpdateResultFields,
		ImportResultFields
	> { .init(provider: provider) }

	func filterResultFields<Fields: FilterFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		RaindropCreationResultFields,
		RaindropHighlightResultFields,
		CollectionResultFields,
		Fields,
		HighlightResultFields,
		UserAuthenticatedResultFields,
		UserPublicResultFields,
		UserUpdateResultFields,
		ImportResultFields
	> { .init(provider: provider) }

	func highlightResultFields<Fields: HighlightFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		RaindropCreationResultFields,
		RaindropHighlightResultFields,
		CollectionResultFields,
		FilterResultFields,
		Fields,
		UserAuthenticatedResultFields,
		UserPublicResultFields,
		UserUpdateResultFields,
		ImportResultFields
	> { .init(provider: provider) }

	func userAuthenticatedResultFields<Fields: UserAuthenticatedFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		RaindropCreationResultFields,
		RaindropHighlightResultFields,
		CollectionResultFields,
		FilterResultFields,
		HighlightResultFields,
		Fields,
		UserPublicResultFields,
		UserUpdateResultFields,
		ImportResultFields
	> { .init(provider: provider) }

	func userPublicResultFields<Fields: UserFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		RaindropCreationResultFields,
		RaindropHighlightResultFields,
		CollectionResultFields,
		FilterResultFields,
		HighlightResultFields,
		UserAuthenticatedResultFields,
		Fields,
		UserUpdateResultFields,
		ImportResultFields
	> { .init(provider: provider) }

	func userUpdateResultFields<Fields: UserAuthenticatedFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		RaindropCreationResultFields,
		RaindropHighlightResultFields,
		CollectionResultFields,
		FilterResultFields,
		HighlightResultFields,
		UserAuthenticatedResultFields,
		UserPublicResultFields,
		Fields,
		ImportResultFields
	> { .init(provider: provider) }

	func importResultFields<Fields: ImportFields & Decodable>(_: Fields.Type) -> API<
		RaindropResultFields,
		RaindropCreationResultFields,
		RaindropHighlightResultFields,
		CollectionResultFields,
		FilterResultFields,
		HighlightResultFields,
		UserAuthenticatedResultFields,
		UserPublicResultFields,
		UserUpdateResultFields,
		Fields
	> { .init(provider: provider) }
}

public extension API<
	RaindropDetails<UserPublicDetails>,
	RaindropDetails<User.IDFields>,
	RaindropHighlightDetails,
	CollectionDetails,
	FilterOverviewFields,
	HighlightDetails,
	UserAuthenticatedDetails,
	UserPublicDetails,
	UserAuthenticatedDetails,
	ImportFolderFields
>{
	init(apiKey: String) {
		let url = "https://api.raindrop.io/rest/v1"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addAuthorization(.bearer(apiKey))
		}.intercept { request, process in
			let response = try await process(request)
			if let error = response.apiError(validating: true) { throw error }
			return response
		}
		
		self.init(provider: provider)
	}
}

// MARK: -
extension API: Catenary.API {
	public typealias APIError = DewdropAPI.Error
}

// MARK: -
private extension API {
	init(provider: Provider) {
		self.provider = provider
		
		raindrops = .init(provider: provider)
		collections = .init(provider: provider)
		tags = .init(provider: provider)
		filters = .init(provider: provider)
		highlights = .init(provider: provider)
		users = .init(provider: provider)
		backups = .init(provider: provider)
		`import` = .init(provider: provider)
	}
}
