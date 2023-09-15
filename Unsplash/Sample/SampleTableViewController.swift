//
//  SampleTableViewController.swift
//  Unsplash
//
//  Created by 서동운 on 9/14/23.
//

import UIKit

enum Section: Int, Hashable, CaseIterable {
    case main = 0
    case second
}

struct Item: Hashable {
    var id: Int
}

typealias SampleDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Item>
typealias SampleTableViewDataSource = UITableViewDiffableDataSource<Section, Item>
typealias SampleCellProvider = (UITableView, IndexPath, Item) -> UITableViewCell

class SampleTableViewController: UITableViewController {
    
    let viewModel = SampleViewModel()
    
    let redView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        let cellProvider: SampleCellProvider = { tableView, indexPath, item in
            let cell = UITableViewCell()
            var configuration = cell.defaultContentConfiguration()
            configuration.text = self.viewModel.user(at: indexPath).introduce
            cell.contentConfiguration = configuration
            return cell
        }
        
        view.addSubview(redView)
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
//        tableView.dataSource = SampleDataSource(tableView: tableView, cellProvider: cellProvider)
    }
}
