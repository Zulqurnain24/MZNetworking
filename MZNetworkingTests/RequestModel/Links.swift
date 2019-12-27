//
//  Links.swift
//  MZNetworkingTests
//
//  Created by Zulqurnain on 12/26/19.
//  Copyright © 2019 Binary Leaf Pvt. Ltd. All rights reserved.
//

import Foundation

struct Links : Codable {
    let profile : String?
    let html : String?
    let download : String?
    
    enum CodingKeys: String, CodingKey {
        
        case profile = "self"
        case html = "html"
        case download = "download"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        profile = try values.decodeIfPresent(String.self, forKey: .profile)
        html = try values.decodeIfPresent(String.self, forKey: .html)
        download = try values.decodeIfPresent(String.self, forKey: .download)
    }
    
}

