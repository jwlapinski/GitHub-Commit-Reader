//
//  ViewController.swift
//  CommitReader
//
//  Created by James Lapinski on 2/28/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import UIKit
import SnapKit

class RepositoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let topRepositoryTableView = UITableView()
    let apiHelper = GitHubApiHelper()
    var repositoriesArray = [RepositoryResponse.Repository]()
    
    override func viewWillAppear(_ animated: Bool) {
        getTopRepositories()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Top Repositories"
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = .white
    }
    
    // MARK: - API Call
    func getTopRepositories() {
        apiHelper.fetchTopRepositoriesInLastMonth { (repositoryResponse, error) in
            if error != nil {
                // to do
                print(error)
            }
            
            if let repositoryResponse = repositoryResponse {
                for repository in repositoryResponse.repositories {
                    self.repositoriesArray.append(repository)
                }
                
                DispatchQueue.main.async {
                    self.setupViews()
                    self.setupConstraints()
                    self.topRepositoryTableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Views and Constraints
    
    func setupViews() {
        topRepositoryTableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "MyCell")
        topRepositoryTableView.dataSource = self
        topRepositoryTableView.delegate = self
        self.view.addSubview(topRepositoryTableView)
    }
    
    func setupConstraints() {
        topRepositoryTableView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Present Commits VC
    
    func presentCommitsViewController(withRepositoryURL url:String) {
        let commitsViewController = CommitsViewController(withUrl: url)
        self.navigationController?.pushViewController(commitsViewController, animated: true)
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! RepositoryTableViewCell
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        let repository = repositoriesArray[indexPath.row]
        
        cell.repositoryNameLabel.text = repository.name
        cell.starCountLabel.text = repository.stargazersCount.stringWithoutZeroFraction
        cell.forkCountLabel.text = repository.forksCount.stringWithoutZeroFraction
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repository = repositoriesArray[indexPath.row]
        self.presentCommitsViewController(withRepositoryURL: repository.url)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }


}

