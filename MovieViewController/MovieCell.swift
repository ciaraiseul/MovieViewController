//
//  MovieCell.swift
//  MovieViewController
//
//  Created by Phạm Trường Giang on 25/9/24.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let identifier = "MovieCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        imageView.frame = CGRect(x: 5, y: 5, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 40)
        titleLabel.frame = CGRect(x: 5, y: contentView.frame.size.height - 35, width: contentView.frame.size.width - 10, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with movie: Movie) {
        imageView.image = UIImage(named: movie.imageName)
        titleLabel.text = movie.title
    }
}

