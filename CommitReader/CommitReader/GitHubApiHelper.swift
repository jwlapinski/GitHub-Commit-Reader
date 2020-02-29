//
//  GitHubApiHelper.swift
//  CommitReader
//
//  Created by James Lapinski on 2/28/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import UIKit

class GitHubApiHelper: NSObject {
    
    func fetchTopRepositoriesInLastMonth() {
        let lastWeekDateString = self.getLastWeekDate()
        let url = URL(string: "https://api.github.com/search/repositories?q=created:\(lastWeekDateString)")
        var urlRequest = URLRequest(url: url!)
        urlRequest.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else { return }
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any]
//                print(jsonData)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchCommitsForRepository(withUrl url:String) {
        
        let commitsUrl = URL(string: url + "/commits")
        var urlRequest = URLRequest(url: commitsUrl!)
        urlRequest.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else { return }
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(jsonData)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}

extension GitHubApiHelper {
    
    func getLastWeekDate() -> String {
        let lastWeekDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyy-MM-dd"
        let lastWeekDateString = dateFormatter.string(from: lastWeekDate!)
        
        return lastWeekDateString
    }
    
}
