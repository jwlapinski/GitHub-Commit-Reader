//
//  ViewController.swift
//  CommitReader
//
//  Created by James Lapinski on 2/28/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let topRepositoryTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Top 5 Repositories"
        self.navigationController?.navigationBar.isTranslucent = false
        
        topRepositoryTableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "MyCell")
        topRepositoryTableView.dataSource = self
        topRepositoryTableView.delegate = self
        
        setupViews()
        setupConstraints()
        
    }
    
    // MARK: - Views and Constraints
    
    func setupViews() {
        self.view.addSubview(topRepositoryTableView)
    }
    
    func setupConstraints() {
        topRepositoryTableView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! RepositoryTableViewCell
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }


}

