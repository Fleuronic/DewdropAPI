// Copyright © Fleuronic LLC. All rights reserved.

enum Fixture {
	case success
	case count
	case removal
	case merge
	case model(Model)
	case list(Model)
	case error(Error)
}

// MARK: -
extension Fixture {
	enum Model {
		case raindrop
		case collection(CollectionType)
		case cover
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
			"Success"
		case .count:
			"Count"
		case .removal:
			"Removal"
		case .merge:
			"Merge"
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
		case .cover:
			"Cover"
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
