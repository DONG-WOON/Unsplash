//
//  PhotoViewCell.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import UIKit

class PhotoViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        var configuration = self.defaultContentConfiguration()
        configuration.textProperties.font = .boldSystemFont(ofSize: 20)
        
        self.contentConfiguration = configuration
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func update(data: PhotoResult?) {
        backgroundColor = data != nil ? .gray : .clear
        textLabel?.text = data?.id
        Task {
            let image = await loadImage(url: data?.urls.thumb)
            self.imageView?.image = image
        }
    }
    
    private func loadImage(url: String?) async -> UIImage? {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url!)!)
            return UIImage(data: data)
        } catch {
            print(error)
        }
        return nil
    }
}

