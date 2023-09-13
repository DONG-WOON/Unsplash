//
//  PhotoViewCell.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import UIKit
import SnapKit
import Kingfisher

class PhotoViewCell: UITableViewCell {
    
    let photoImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        configureViews()
        setAttributes()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImageView.image = nil
        
    }
    
    func update(data: PhotoResult?) {
        backgroundColor = data != nil ? .gray : .clear
        photoImageView.kf.setImage(with: URL(string: (data?.urls.thumb) ?? ""))
        titleLabel.text = data?.id
    }
}

extension PhotoViewCell {
    func configureViews() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(titleLabel)
    }
    
    func setAttributes() {
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        titleLabel.numberOfLines = 1
        titleLabel.font = .boldSystemFont(ofSize: 15)
    }
    
    func setConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(contentView).inset(10)
            make.width.equalTo(photoImageView.snp.height).multipliedBy(1.2)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(photoImageView)
            make.leading.equalTo(photoImageView.snp.trailing).offset(10)
            make.trailing.greaterThanOrEqualTo(contentView).inset(10)
        }
    }
}

