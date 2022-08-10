//
//  MovieTableViewCell.swift
//  netflix_clone
//
//  Created by wassim on 10/8/2022.
//

import UIKit
import SDWebImage
class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    private let playButton:UIButton={
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white

        return button
    }()
    private let titleLabel:UILabel={
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let PosterImageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(PosterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        applyConstraints()
        
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        PosterImageView.frame = contentView.bounds
//    }
    
    private func applyConstraints()  {
        let posterImageConstraints = [
            PosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            PosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            PosterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            PosterImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: PosterImageView.trailingAnchor,constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        let playButtonConstraints = [
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(posterImageConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playButtonConstraints)

        
        
    }
    
    public func configure(with model:MovieViewModel){
        guard let url = URL(string: APIConfig.IMAGE_BASE_URL+model.posterUrl) else { return }
        PosterImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
