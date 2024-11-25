// Copyright © Fleuronic LLC. All rights reserved.

public protocol Response: Decodable {
	associatedtype Resource: Decodable

	var result: Bool { get }
}
