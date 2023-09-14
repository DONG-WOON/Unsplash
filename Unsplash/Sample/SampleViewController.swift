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
        
        cell.configurationUpdateHandler = { [weak self] cell, state in
            var content = cell.defaultContentConfiguration().updated(for: state)
            content.text = self?.viewModel.user(at: indexPath).introduce
            content.textProperties.font = .boldSystemFont(ofSize: 20)
            
            if state.isHighlighted {
                cell.backgroundColor = .red
            }
            
            cell.contentConfiguration = content
        }
        
        return cell
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
