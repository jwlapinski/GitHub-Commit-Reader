//
//  RepositoryTableViewCell.swift
//  CommitReader
//
//  Created by James Lapinski on 2/28/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import UIKit
import SnapKit

class RepositoryTableViewCell: UITableViewCell {
    
    let repositoryNameLabel = UILabel()
    let starCountLabel = UILabel()
    let forkCountLabel = UILabel()
    private let arrowImageView = UIImageView()
    private let starImageView = UIImageView()
    private let forkImageView = UIImageView()
    private let forksStackView = UIStackView()
    private let starCountStackView = UIStackView()
    private let verticalStackView = UIStackView()
    private let bottomHorizontalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
                
        // Repository Name Label
        repositoryNameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        // Star View
        starImageView.image = UIImage(named: "starIcon")
        starCountLabel.font = UIFont.systemFont(ofSize: 14)
        
        starCountStackView.alignment = .center
        starCountStackView.axis = .horizontal
        starCountStackView.distribution = .equalSpacing
        starCountStackView.spacing = 2
        starCountStackView.addArrangedSubview(starImageView)
        starCountStackView.addArrangedSubview(starCountLabel)
        
        // Frok View
        forkImageView.image = UIImage(named: "forkIcon")
        forkCountLabel.font = UIFont.systemFont(ofSize: 14)
        
        forksStackView.alignment = .center
        forksStackView.axis = .horizontal
        forksStackView.distribution = .equalSpacing
        forksStackView.spacing = 2
        forksStackView.addArrangedSubview(forkImageView)
        forksStackView.addArrangedSubview(forkCountLabel)
        
        arrowImageView.image = UIImage(named: "chevronIcon")
        self.contentView.addSubview(arrowImageView)
        
        // Horizontal StackView
        bottomHorizontalStackView.alignment = .leading
        bottomHorizontalStackView.axis = .horizontal
        bottomHorizontalStackView.distribution = .equalSpacing
        bottomHorizontalStackView.spacing = 20
        bottomHorizontalStackView.addArrangedSubview(starCountStackView)
        bottomHorizontalStackView.addArrangedSubview(forksStackView)
        
        // Vertical StackView
        verticalStackView.alignment = .leading
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalCentering
        verticalStackView.spacing = 5
        verticalStackView.addArrangedSubview(repositoryNameLabel)
        verticalStackView.addArrangedSubview(bottomHorizontalStackView)
        self.contentView.addSubview(verticalStackView)
        
    }
    
    func setupConstraints() {
        
        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(arrowImageView.snp.leading)
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
