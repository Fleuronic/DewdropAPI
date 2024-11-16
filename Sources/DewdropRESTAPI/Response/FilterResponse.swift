// Copyright © Fleuronic LLC. All rights reserved.

import protocol DewdropService.FilterFields
import protocol Identity.Identifiable

public typealias FiltersResponse<Fields: FilterFields & Decodable> = Fields
