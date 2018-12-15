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
