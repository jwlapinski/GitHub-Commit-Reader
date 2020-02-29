//
//  CommitTableViewCell.swift
//  CommitReader
//
//  Created by James Lapinski on 2/28/20.
//  Copyright © 2020 JWL. All rights reserved.
//

import UIKit

class CommitTableViewCell: UITableViewCell {

    let authorLabel = UILabel()
    let hashLabel = UILabel()
    let messageLabel = UILabel()
    private let labelStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        authorLabel.font = UIFont.boldSystemFont(ofSize: 20)
        authorLabel.textAlignment = .left
        
        hashLabel.font = UIFont.systemFont(ofSize: 12)
        hashLabel.textAlignment = .left
        
        messageLabel.font = UIFont.systemFont(ofSize: 12)
        messageLabel.textAlignment = .left
        
        labelStackView.alignment = .leading
        labelStackView.axis = .vertical
        labelStackView.distribution = .equalSpacing
        labelStackView.spacing = 2
        labelStackView.addArrangedSubview(authorLabel)
        labelStackView.addArrangedSubview(hashLabel)
        labelStackView.addArrangedSubview(messageLabel)
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
