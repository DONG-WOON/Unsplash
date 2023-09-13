//
//  PhotoViewController.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import UIKit
import Combine

class PhotoViewController: UIViewController {
    
    private let viewModel: PhotoViewModel
    private var anyCancellable = [AnyCancellable]()
    
    @IBOutlet var tableView: UITableView!
    
    init(viewModel: PhotoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = PhotoViewModel()
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetch()
        bindViewModel()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PhotoViewCell.self, forCellReuseIdentifier: "PhotoViewCell")
    }
    
    private func bindViewModel() {
        viewModel.$photo
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.tableView.reloadData()
            }.store(in: &anyCancellable)
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
