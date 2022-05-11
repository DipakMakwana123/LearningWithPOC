//
//  PlayerCollectionCell.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 22/04/22.
//

import UIKit
import AVKit


class PlayerCollectionCell: UICollectionViewCell {

    var playerContainerView: UIView!
    // Reference for the player view.
    private var playerView: UIKitPlayerView!
    
    let thumbImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()

    // URL for the test video.
    private let videoURLSting = "https://bit.ly/swswift"//"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playerContainerView = UIView()
        configure()
        setUpThumbImage()
        setUpPlayerView()
        
        prepareVideo()
    }
    
    private func configure(){
        
        contentView.addSubview(playerContainerView)
        playerContainerView.translatesAutoresizingMaskIntoConstraints = false
        playerContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        playerContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        playerContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
                
    }
    private func setUpThumbImage() {
        
        playerContainerView?.addSubview(thumbImage)
       
        thumbImage.translatesAutoresizingMaskIntoConstraints = false
        thumbImage.leadingAnchor.constraint(equalTo: playerContainerView.leadingAnchor).isActive = true
        thumbImage.trailingAnchor.constraint(equalTo: playerContainerView.trailingAnchor).isActive = true
        thumbImage.topAnchor.constraint(equalTo: playerContainerView.topAnchor).isActive = true
        thumbImage.bottomAnchor.constraint(equalTo: playerContainerView.bottomAnchor).isActive = true
    }
    private func setUpPlayerView() {
        playerView = UIKitPlayerView()
        playerContainerView?.addSubview(playerView)

        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.leadingAnchor.constraint(equalTo: playerContainerView.leadingAnchor).isActive = true
        playerView.trailingAnchor.constraint(equalTo: playerContainerView.trailingAnchor).isActive = true
        playerView.heightAnchor.constraint(equalTo: playerContainerView.widthAnchor, multiplier: 16/9).isActive = true
        playerView.centerYAnchor.constraint(equalTo: playerContainerView.centerYAnchor).isActive = true
    }
    func prepareVideo() {
        guard let url = URL(string: videoURLSting) else { return }
        playerView.configure(with: url, compilation: { [weak self] image in
            DispatchQueue.main.async {
        
                guard let self = self else {return}
        
                if let _ = image {
                   // self.thumbImage.image = image1
                    self.thumbImage.image = UIImage(named: "sample-logo")
                }
            }
        })
        
    }
    func prepareToPlay() {
        
    }
}
