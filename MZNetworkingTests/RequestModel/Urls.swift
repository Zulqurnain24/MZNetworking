//
//  Urls.swift
//  MZNetworkingTests
//
//  Created by Zulqurnain on 12/26/19.
//  Copyright © 2019 Binary Leaf Pvt. Ltd. All rights reserved.
//

import Foundation

struct Urls : Codable {
    let raw : String?
    let full : String?
    let regular : String?
    let small : String?
    let thumb : String?
    
    enum CodingKeys: String, CodingKey {
        
        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        raw = try values.decodeIfPresent(String.self, forKey: .raw)
        full = try values.decodeIfPresent(String.self, forKey: .full)
        regular = try values.decodeIfPresent(String.self, forKey: .regular)
        small = try values.decodeIfPresent(String.self, forKey: .small)
        thumb = try values.decodeIfPresent(String.self, forKey: .thumb)
    }
    
}
