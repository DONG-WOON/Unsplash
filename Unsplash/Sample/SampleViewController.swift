//
//  SampleViewController.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import UIKit

class SampleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let viewModel = SampleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.list.bind { _ in
            self.tableView.reloadData()
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SampleCell")
    }
}

extension SampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell")!
        
        configure(cell) { [weak self] in
            $0.text = self?.viewModel.user(at: indexPath).introduce
            $0.textProperties.font = .boldSystemFont(ofSize: 20)
        }
        
        return cell
    }
    
    func configure(_ cell: UITableViewCell, configure: ((inout UIListContentConfiguration) -> Void)? = nil) {
        var configuration = cell.defaultContentConfiguration()
        configure?(&configuration)
        cell.contentConfiguration = configuration
    }
}

extension SampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.addUser(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
