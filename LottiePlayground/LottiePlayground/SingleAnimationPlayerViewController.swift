//
//  SingleAnimationPlayerViewController.swift
//  LottiePlayground
//
//  Created by Haoxin Li on 12/15/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Lottie
import UIKit

final class SingleAnimationPlayerViewController: UIViewController {
    
    private let nameOfAnimation: String
    private lazy var animationView: LOTAnimationView = {
        let v = LOTAnimationView(name: nameOfAnimation)
        v.autoReverseAnimation = true
        v.loopAnimation = true
        v.play()
        return v
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    init(nameOfAnimation: String) {
        self.nameOfAnimation = nameOfAnimation
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
}

// MARK: - view setup

private extension SingleAnimationPlayerViewController {
    
    func setUpView() {
        view.backgroundColor = .white
        setUpAnimationView()
    }
    
    func setUpAnimationView() {
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // tap
        animationView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
        // pan
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.minimumNumberOfTouches = 1
        pan.maximumNumberOfTouches = 1
        animationView.addGestureRecognizer(pan)
    }
}

// MARK: - user interaction

private extension SingleAnimationPlayerViewController {
    
    @objc func handleTap(_ tap: UITapGestureRecognizer) {
        if animationView.isAnimationPlaying {
            animationView.pause()
        } else {
            animationView.play()
        }
    }
    
    @objc func handlePan(_ pan: UIPanGestureRecognizer) {
        guard let panningView = pan.view else {
            assertionFailure("\(#function) panning view is nil")
            return
        }
        let translation = pan.translation(in: view)
        panningView.transform = panningView.transform.translatedBy(x: translation.x, y: translation.y)
        pan.setTranslation(.zero, in: view)
    }
}
