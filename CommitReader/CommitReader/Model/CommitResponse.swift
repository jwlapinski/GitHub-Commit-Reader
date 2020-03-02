//
//  Commit.swift
//  CommitResponse
//
//  Created by James Lapinski on 3/1/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import Foundation

class CommitResponse: Decodable {
    struct Commit: Decodable {
        let author: Author?
        let commitSha: String
        let commitDetails: CommitDetails
        
        enum CodingKeys: String, CodingKey {
            case author
            case commitSha = "sha"
            case commitDetails = "commit"
        }
    }
    
    struct Author: Decodable {
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case name = "login"
        }
    }
    
    struct CommitDetails: Decodable {
        let message: String
        
        enum CodingKeys: String, CodingKey {
            case message
        }
    }
    
}
