//
//  SectionHeader.swift
//  UICollectionViewTest
//
//  Created by Ivan Terekhov on 01.08.2023.
//

import UIKit

class SectionHeader: UICollectionReusableView {

    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "Label Title"
        label.font = .boldSystemFont(ofSize: 40)

        return label
    } ()

    override func layoutSubviews() {
        addSubviews()
        self.backgroundColor = .white
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func addSubviews() {
        self.addSubview(label)
    }
}
