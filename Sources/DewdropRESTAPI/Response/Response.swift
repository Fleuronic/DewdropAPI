// Copyright © Fleuronic LLC. All rights reserved.

public protocol Response: Decodable {
	var result: Bool { get }
}
