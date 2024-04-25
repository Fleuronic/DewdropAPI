// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.URL
import protocol Catenary.Payload

struct URLCheckPayload: Payload {
	let urls: [URL]
}
