//
//  SampleCollectionViewController.swift
//  Unsplash
//
//  Created by 서동운 on 9/14/23.
//

import UIKit

final class SampleCollectionViewController: UIViewController {
    typealias SnapShot = NSDiffableDataSourceSnapshot<Section, User>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, User>
    
    private let viewModel = SampleViewModel()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    private lazy var dataSource = SampleDataSource(collectionView: collectionView)
    private lazy var plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonDidTapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.list.bind { [weak self] users in
            var snapshot = SnapShot()
            snapshot.appendSections(Section.allCases)
            snapshot.appendItems(users, toSection: .main)
            self?.dataSource.apply(snapshot)
        }
        
        var snapshot = SnapShot()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.list.value)
        dataSource.apply(snapshot)
        
        configureViews()
    }
    
    @objc func plusButtonDidTapped() {
        viewModel.addUser(User(name: "감자", age: 20))
    }
}
extension SampleCollectionViewController {
    private func configureViews() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        navigationItem.rightBarButtonItem = plusButton
    }
    
    static func createLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}

class SampleDataSource: UICollectionViewDiffableDataSource<Section, User> {
    typealias CellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, User>
    
    init(collectionView: UICollectionView) {
        
        let cellRegistration = CellRegistration { (cell, indexPath, item) in
            
            var configuration = UIListContentConfiguration.cell()
            
            configuration.textProperties.font = .italicSystemFont(ofSize: 15)
            configuration.text = item.introduce
            configuration.image = UIImage(systemName: "star.fill")
            
            var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfiguration.backgroundColor = .lightGray
            backgroundConfiguration.cornerRadius = 10
            backgroundConfiguration.strokeColor = .systemPink
            backgroundConfiguration.strokeWidth = 2
            
            cell.contentConfiguration = configuration
            cell.backgroundConfiguration = backgroundConfiguration
        }
        
        super.init(collectionView: collectionView) { collectionView, indexPath, user in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                    for: indexPath, item: user)
            return cell
        }
    }
}
