// Copyright © Fleuronic LLC. All rights reserved.

public protocol Response: Decodable {
	associatedtype Item: Decodable

	var result: Bool { get }
}
