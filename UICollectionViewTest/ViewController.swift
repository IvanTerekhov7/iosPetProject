//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by Ivan Terekhov on 25.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var animalsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: (view.bounds.width - 60) / 2,
            height: view.bounds.width / 2
        )
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 50

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    private var dataSource: [UIImage?] = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6"),
        UIImage(named: "7"),
        UIImage(named: "8"),
        UIImage(named: "9"),
        UIImage(named: "10")
    ]

    private var carsDataSource: [UIImage?] = [
        UIImage(named: "C1"),
        UIImage(named: "C2"),
        UIImage(named: "C3"),
        UIImage(named: "C4"),
        UIImage(named: "C5"),
        UIImage(named: "C6"),
        UIImage(named: "C7"),
        UIImage(named: "C8")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        animalsCollectionView.register(
            SectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header"
        )
    }

    private func addSubviews() {
        view.addSubview(animalsCollectionView)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            animalsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animalsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animalsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            animalsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        if section == 0 {
            return dataSource.count
        } else {
            return carsDataSource.count
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as? CustomCell else {
            return UICollectionViewCell()
        }
        if indexPath.section == 0 {
            cell.imageView.image = dataSource[indexPath.item]
        } else {
            cell.imageView.image = carsDataSource[indexPath.item]
        }

        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(
            top: 20,
            left: 20,
            bottom: .zero,
            right: 20
        )
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 70)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! SectionHeader

            if indexPath.section == 0 {
                sectionHeader.label.text = "Animals"
            } else {
                sectionHeader.label.text = "Cars"
            }

            return sectionHeader
        }
        return UICollectionReusableView()
    }
}

// MARK: - Constants

private extension CGFloat {

    static let minimumIterItemSpacing: CGFloat = 10
}
