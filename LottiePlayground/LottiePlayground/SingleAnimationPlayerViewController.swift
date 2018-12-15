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
        
        // tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.delegate = self
        v.addGestureRecognizer(tap)
        
        // pan
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.delegate = self
        v.addGestureRecognizer(pan)
        
        // pinch
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch.delegate = self
        v.addGestureRecognizer(pinch)
        
        // rotate
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(_:)))
        rotate.delegate = self
        v.addGestureRecognizer(rotate)
        
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

extension SingleAnimationPlayerViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
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
    }
}

// MARK: - user interaction
// Inspired by https://www.raywenderlich.com/433-uigesturerecognizer-tutorial-getting-started

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
    
    @objc func handlePinch(_ pinch: UIPinchGestureRecognizer) {
        guard let pinchingView = pinch.view else {
            assertionFailure("\(#function) pinching view is nil")
            return
        }
        pinchingView.transform = pinchingView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
    @objc func handleRotate(_ rotate: UIRotationGestureRecognizer) {
        guard let rotatingView = rotate.view else {
            assertionFailure("\(#function) rotating view is nil")
            return
        }
        rotatingView.transform = rotatingView.transform.rotated(by: rotate.rotation)
        rotate.rotation = 0
    }
}
