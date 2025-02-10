// Copyright © Fleuronic LLC. All rights reserved.

enum Fixture {
	case success
	case count
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
		case child
	}

	enum Error {
		case notFound
	}

	var path: String {
		switch self {
		case .success:
			return "Success"
		case .count:
			return "Count"
		case let .model(model):
			return model.path
		case let .list(model):
			return model.path + "List"
		case let .error(error):
			return error.path + "Error"
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
		case .child:
			"Child"
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
