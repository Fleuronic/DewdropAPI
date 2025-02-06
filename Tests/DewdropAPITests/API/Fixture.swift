// Copyright © Fleuronic LLC. All rights reserved.

enum Fixture {
	case model(Model)
	case list(Model)
	case error(Error)
}

// MARK: -
extension Fixture {
	enum Model {
		case raindrop
		case collection(CollectionType)
		case user(authenticated: Bool = false)
	}

	enum CollectionType {
		case root
		case system
	}

	enum Error {
		case notFound
	}

	var path: String {
		switch self {
		case let .model(model):
			model.path
		case let .list(model):
			model.path + "List"
		case let .error(error):
			error.path + "Error"
		}
	}
}

// MARK: -
extension Fixture.Model {
	var path: String {
		switch self {
		case .raindrop:
			"Raindrop"
		case let .collection(type):
			type.path + "Collection"
		case let .user(authenticated):
			(authenticated ? "Authenticated" : .init()) + "User"
		}
	}
}

// MARK: -
extension Fixture.CollectionType {
	var path: String {
		switch self {
		case .root:
			.init()
		case .system:
			"System"
		}
	}
}

// MARK: -
extension Fixture.Error {
	var path: String {
		switch self {
		case .notFound:
			"NotFound"
		}
	}
}
