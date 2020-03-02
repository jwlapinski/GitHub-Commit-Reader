//
//  CommitTableViewCell.swift
//  CommitReader
//
//  Created by James Lapinski on 2/28/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import UIKit

class CommitTableViewCell: UITableViewCell {
    
    // Labels
    private let messageTitleLabel = UILabel()
    private let authorTitleLabel = UILabel()
    private let hashTitleLabel = UILabel()
    let authorNameLabel = UILabel()
    let hashCodeLabel = UILabel()
    let messageContentsLabel = UILabel()
    
    // StackViews
    private let messageStackView = UIStackView()
    private let authorStackView = UIStackView()
    private let hashStackView = UIStackView()
    private let labelStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        // Commit Author Views
        authorTitleLabel.font  = UIFont.boldSystemFont(ofSize: 15)
        authorTitleLabel.text = "Author:"
        authorNameLabel.font = UIFont.systemFont(ofSize: 15)
        authorNameLabel.textColor = .darkGray
        authorNameLabel.textAlignment = .left
        
        authorStackView.alignment = .leading
        authorStackView.axis = .horizontal
        authorStackView.distribution = .equalCentering
        authorStackView.spacing = 2
        authorStackView.addArrangedSubview(authorTitleLabel)
        authorStackView.addArrangedSubview(authorNameLabel)
        
        // Commit Hash Views
        hashTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        hashTitleLabel.text = "Hash:"
        hashCodeLabel.font = UIFont.systemFont(ofSize: 15)
        hashCodeLabel.textColor = .darkGray
        hashCodeLabel.textAlignment = .left
        
        hashStackView.alignment = .leading
        hashStackView.axis = .horizontal
        hashStackView.distribution = .equalCentering
        hashStackView.spacing = 2
        hashStackView.addArrangedSubview(hashTitleLabel)
        hashStackView.addArrangedSubview(hashCodeLabel)
        
        // Commit Message Views
        messageTitleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        messageTitleLabel.text = "Commit:"
        messageContentsLabel.font = UIFont.systemFont(ofSize: 15)
        messageContentsLabel.textAlignment = .left
        messageContentsLabel.textColor = .darkGray
//        messageContentsLabel.numberOfLines = 2
        
        messageStackView.alignment = .leading
        messageStackView.axis = .horizontal
        messageStackView.distribution = .equalCentering
        messageStackView.spacing = 2
        messageStackView.addArrangedSubview(messageTitleLabel)
        messageStackView.addArrangedSubview(messageContentsLabel)
        
        // Main Stack View
        labelStackView.alignment = .leading
        labelStackView.axis = .vertical
        labelStackView.distribution = .equalSpacing
        labelStackView.spacing = 5
        labelStackView.addArrangedSubview(authorStackView)
        labelStackView.addArrangedSubview(hashStackView)
        labelStackView.addArrangedSubview(messageStackView)
        self.contentView.addSubview(labelStackView)
    }
    
    func setupConstraints() {
        labelStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
