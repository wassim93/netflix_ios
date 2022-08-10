//
//  HeroHeaderUIView.swift
//  netflix_clone
//
//  Created by wassim on 25/7/2022.
//

import UIKit

class HeroHeaderUIView: UIView {
    private let playButton:UIButton={
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let downloadButton:UIButton={
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let heroImageView:UIImageView={
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "unnamed")
        
        return imageView
    }()
    
    fileprivate func applyConstraints() {
        let playBtnConstraints = [playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),playButton.widthAnchor.constraint(equalToConstant: 100)]
        let downloadBtnConstraints = [downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),downloadButton.widthAnchor.constraint(equalToConstant: 100)]
        NSLayoutConstraint.activate(playBtnConstraints)
        NSLayoutConstraint.activate(downloadBtnConstraints)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)

        applyConstraints()
        
    }
    fileprivate func addGradient() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors=[UIColor.clear.cgColor,UIColor.systemBackground.cgColor]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds

    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
