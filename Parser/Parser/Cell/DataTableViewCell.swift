//
//  DataCell.swift
//  Parser
//
//  Created by Dmitry on 12.08.2021.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        titleLabel.font = .systemFont(ofSize: 28, weight: .semibold)
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.pin.all()
        
        titleLabel.pin
            .horizontally(10)
            .vertically()
    }
    
    func configure( with title: String) {
        titleLabel.text = title
    }
    
}
