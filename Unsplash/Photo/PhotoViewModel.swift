//
//  PhotoViewModel.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import Foundation

class PhotoViewModel {
    
    var photo = Observable(value:Photo(total: 0, total_pages: 0, results: []))
    
    var numberOfRowsInSection: Int {
        photo.value.results?.count ?? 0
    }
    
    func fetch() {
        APIService.shared.searchPhoto(query: "sky") { photo in
            guard let photo else { return }
            self.photo.value = photo
        }
    }
    
    func data(at indexPath: IndexPath) -> PhotoResult? {
        photo.value.results?[indexPath.row]
    }
}
