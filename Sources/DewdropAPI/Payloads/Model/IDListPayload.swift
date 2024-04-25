// Copyright © Fleuronic LLC. All rights reserved.

import protocol Catenary.Payload
import protocol Identity.Identifiable

struct IDListPayload<Model: Identifiable>: Payload where Model.ID: Encodable {
	let ids: [Model.ID]
}
