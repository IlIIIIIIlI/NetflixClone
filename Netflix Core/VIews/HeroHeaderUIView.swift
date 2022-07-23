//
//  HeroHeaderUIView.swift
//  Netflix Core
//
//  Created by 杨程凯 on 2022/7/20.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    // give a frame, assign a image, and two buttons
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.yellow.cgColor
        // add width
        button.layer.borderWidth = 1
        // layout the button perfectly, add constraint
        button.translatesAutoresizingMaskIntoConstraints = false
        // try to give the button a smooth, slippery, sleek wai wei
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.yellow.cgColor
        // add width
        button.layer.borderWidth = 1
        // layout the button perfectly, add constraint
        button.translatesAutoresizingMaskIntoConstraints = false
        // try to give the button a smooth, slippery, sleek wai wei
        button.layer.cornerRadius = 5
        return button
    }()
    
    // for the image one
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        // use the image in our asset
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    // to make the header photo a little bit beautiful, we add gradient fact
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        // we need do a frame for the gradient part
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    
    override init(frame:CGRect){
        super.init(frame: frame)
        // frame li mian jia tu pian
        addSubview(heroImageView)
        addGradient()
        // add the button to the frame
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraint()
    }
    
    private func applyConstraint(){
        // for play constraint
        let playButtonConstraints = [
            // this setting can be for multi-language peoples, from left to right
            // adjust the button's position
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        
        // for download constraint
        let downloadButtonConstraints = [
            // this setting can be for multi-language peoples, from left to right
            // adjust the button's position
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -90),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    // as we add subview above, we override to re-define what is inside the subview
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
