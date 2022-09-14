//
//  CustomPlayerView.swift
//  AppMusic
//
//  Created by Raphael Augusto on 14/09/22.
//

import UIKit
import MarqueeLabel

final class CustomPlayerView: UIView, ConfigurableView  {
    
    //MARK: - Properties
    var videoTimer: Timer?
    var time: CGFloat = 0.0
    
    
    //MARK: - Elements Visual
    private lazy var imageView: UIImageView = {
        let img         = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    private lazy var marqueeLabel: MarqueeLabel = {
        let ml              = MarqueeLabel()
        ml.font             = UIFont(name: "Avenir-Heavy", size: 18)
        ml.textColor        = .white.withAlphaComponent(0.8)
        ml.type             = .continuous
        ml.animationCurve   = .linear
        ml.fadeLength       = 10.0
        ml.leadingBuffer    = 30.0
        ml.trailingBuffer   = 30.0
        ml.translatesAutoresizingMaskIntoConstraints = false
        
        return ml
    }()
    
    private lazy var pausePlayButton: UIImageView = {
        let img         = UIImageView()
        img.image       = UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate)
        img.tintColor   = .white.withAlphaComponent(0.8)
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    private lazy var trackBar: UIProgressView = {
        let pr = UIProgressView()
        pr.progressTintColor = .yellow.withAlphaComponent(0.8)
        pr.progress = 0.0
        pr.translatesAutoresizingMaskIntoConstraints = false
        
        return pr
    }()
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        
        setup()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Init Components
    private func setup() {
        initLayout()
    }
}

//MARK: - Components and Constraints
extension CustomPlayerView {
    
    func initSubviews() {
        addSubview(imageView)
        addSubview(marqueeLabel)
        addSubview(pausePlayButton)
        addSubview(trackBar)
        
        videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
    }
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 90),
            
            marqueeLabel.topAnchor.constraint(equalTo: topAnchor,constant: 32),
            marqueeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            marqueeLabel.trailingAnchor.constraint(equalTo: pausePlayButton.leadingAnchor, constant: -5),

            pausePlayButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            pausePlayButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            pausePlayButton.heightAnchor.constraint(equalToConstant: 40),
            pausePlayButton.widthAnchor.constraint(equalToConstant: 40),
            
            trackBar.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            trackBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            trackBar.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    
    public func setupView(data: CardListModel) {
        self.imageView.image    = UIImage(named: data.listImage ?? "")
        self.marqueeLabel.text  = data.listTitle
        self.time               = 0.0
        self.trackBar.progress  = 0.0
        self.videoTimer         = nil
        self.videoTimer         = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
    }
}


//MARK: - Action
extension CustomPlayerView {
    
    @objc func changeTrackBar() {
        self.time += 0.001
        self.trackBar.progress = Float(self.time / 120)
        
        if self.time >= 120 {
            self.videoTimer?.invalidate()
            self.videoTimer = nil
        }
    }
}
