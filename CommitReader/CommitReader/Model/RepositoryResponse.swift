//
//  RepositoryResponse.swift
//  CommitReader
//
//  Created by James Lapinski on 2/29/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import Foundation

class RepositoryResponse: Decodable {
    
    struct Repository: Codable {
        let url: String
        let name: String
        let stargazersCount: Double
        let forksCount: Double
        
        enum CodingKeys: String, CodingKey {
            case url
            case name
            case stargazersCount = "stargazers_count"
            case forksCount = "forks"
        }
    }
    
    let repositories:[Repository]
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
    
    
}
