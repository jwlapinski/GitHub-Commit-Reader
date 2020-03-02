//
//  CommitsViewController.swift
//  CommitReader
//
//  Created by James Lapinski on 3/1/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import UIKit

class CommitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let url: String?
    private let apiHelper = GitHubApiHelper()
    private var commitsTableView = UITableView()
    private var commitsArray = [CommitResponse.Commit]()

    init(withUrl url:String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let url = url {
            apiHelper.fetchCommitsForRepository(withUrl: url) { (commits, error) in
                if error != nil {
                    // to do
                }
                
                if let commits = commits {
                    self.commitsArray = commits
                    
                    DispatchQueue.main.async {
                        self.setupViews()
                        self.setupConstraints()
                        self.commitsTableView.reloadData()
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Views and Constraints
    
    func setupViews() {
        commitsTableView.register(CommitTableViewCell.self, forCellReuseIdentifier: "MyCell")
        commitsTableView.dataSource = self
        commitsTableView.delegate = self
        commitsTableView.backgroundColor = .white
        self.view.addSubview(commitsTableView)
    }
    
    func setupConstraints() {
        commitsTableView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - UITableViewDelegate Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath) as! CommitTableViewCell
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        let commitObject = commitsArray[indexPath.row]
        if let author = commitObject.author {
            cell.authorNameLabel.text = author.name
        }
        cell.hashCodeLabel.text = commitObject.commitSha
        cell.messageContentsLabel.text = commitObject.commitDetails.message
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
