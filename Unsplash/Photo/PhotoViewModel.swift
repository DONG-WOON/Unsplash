//
//  PhotoViewModel.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import Foundation

class PhotoViewModel {
    @Published var photo: Photo?
    
    var numberOfRowsInSection: Int {
        photo?.results?.count ?? 0
    }
    
    func fetch() {
        APIService.shared.searchPhoto(query: "sky") { photo in
            guard let photo else { return }
            self.photo = photo
        }
    }
    
    func data(at indexPath: IndexPath) -> PhotoResult? {
        let photoResult = photo?.results?[indexPath.row]
        return photoResult
    }
}
