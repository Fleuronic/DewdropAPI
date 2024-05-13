// Copyright © Fleuronic LLC. All rights reserved.

//import Catena
//
//import struct Dewdrop.Tag
//import struct Dewdrop.Collection
//import struct DewdropService.FilterListFields
//import protocol DewdropService.FilterSpec
//
//extension API: FilterSpec {
//	public func listFilters(forCollectionWith id: Collection.ID = .all, searchingFor search: String? = nil, sortingTagsBy tagSort: Tag.Sort? = nil) async -> Self.Result<FilterListFields> {
//		await get(/.filters, /id) {
//			FilterListParameters(
//				search: search,
//				tagSort: tagSort
//			)
//		}
//	}
//}
//
//// MARK: -
//private enum PathComponents: String, PathComponent {
//	case filters
//}
//
//private prefix func /(component: PathComponents) -> PathComponent { component }
