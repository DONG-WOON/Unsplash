//
//  PhotoViewController.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import UIKit

class PhotoViewController: UIViewController {
    
    let viewModel = PhotoViewModel()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetch()
        
        viewModel.photo.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PhotoViewCell.self, forCellReuseIdentifier: "PhotoViewCell")
    }
}

extension PhotoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoViewCell") as? PhotoViewCell else { return UITableViewCell() }
        let data = viewModel.data(at: indexPath)
        cell.update(data: data)
        return cell
    }
}

extension PhotoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension UITableView {
    
}
