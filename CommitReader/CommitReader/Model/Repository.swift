//
//  Repository.swift
//  CommitReader
//
//  Created by James Lapinski on 2/29/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import Foundation

class RepositoryResponse: Decodable {
    
    struct Repository: Codable {
        var url: String
        var name: String
        var stargazersCount: Double
        var watchers: Double
        
        enum CodingKeys: String, CodingKey {
            case url
            case name
            case stargazersCount = "stargazers_count"
            case watchers
        }
        
    }
    
    var repositories:[Repository]
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
    
    
}
