//
//  FriendsPhotoViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 18.06.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class FriendsPhotoViewController: UIViewController, UIViewControllerTransitioningDelegate, UIGestureRecognizerDelegate  {
    
    enum AnimationDirection {
        case left
        case right
    }
    
    private var propertyAnimator: UIViewPropertyAnimator!
    private var animationDirection: AnimationDirection = .left
    private var gestRecognizer: UIPanGestureRecognizer!
    
    var index = 0
    var user: User?
    var startFrame: CGRect!
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        return image
    }()
    var imageView2: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gestRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))
        gestRecognizer.delegate = self
        gestRecognizer.maximumNumberOfTouches = 2
        view.addGestureRecognizer(gestRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        imageView2.isHidden = false
        imageView.image = user!.avatar![index]
    }
    
    override func loadView() {
        super.loadView()
        configureUI()
    }
    
    private func configureUI() {
        self.view.addSubview(imageView)
        self.view.insertSubview(imageView2, belowSubview: imageView)

        constraintToSafeArea(imageView)
        constraintToSafeArea(imageView2)
        
        imageView2.isHidden = true
    }
    
    func constraintToSafeArea(_ imageView: UIImageView) {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        DismissAnimator(self.startFrame)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        PresentAnimator(self.startFrame)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
       return gestureRecognizer == self.gestRecognizer!
    }
    
    @objc func viewPanned(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            animationDirection = recognizer.velocity(in: self.view).x > 0 ? .right : .left
            let flag = CGFloat(animationDirection == .left ? -1 : 1)
            guard (index >= 1 && animationDirection == .right) || (index + 1 < user!.avatar!.count && animationDirection == .left) else {
                propertyAnimator = nil
                return
            }
            imageView2.transform = CGAffineTransform(translationX: -flag*self.imageView2.bounds.width, y: 0).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
            imageView2.image = user!.avatar![index + Int(-flag)]
            propertyAnimator = UIViewPropertyAnimator(duration: 0.8, curve: .easeInOut)
            propertyAnimator.addAnimations{
                self.imageView.transform = CGAffineTransform(translationX: flag*self.imageView.bounds.width, y: 0).concatenating(CGAffineTransform(scaleX: 0.7, y: 0.7))
                self.imageView2.transform = .identity
            }
            propertyAnimator.addCompletion { position in
                switch position {
                case .end:
                    let i = self.index - Int(flag)
                    guard i >= 0 && i < self.user!.avatar!.count else { return }
                    self.index -= Int(flag)
                    self.imageView.image = self.user!.avatar![self.index]
                    self.imageView.transform = .identity
                    self.imageView2.image = nil
                case .start:
                    self.imageView2.transform = CGAffineTransform(translationX: -flag*self.imageView2.bounds.width, y: 0).concatenating(CGAffineTransform(scaleX: 1.2, y: 1.2))
                case .current:
                    break
                @unknown default:
                    break
                }
            }
            propertyAnimator.startAnimation()
        case .changed:
            guard let pa = self.propertyAnimator else { return }
            pa.fractionComplete = min(max(0, abs(recognizer.translation(in: self.view).x) / self.view.bounds.width), 1)//* (animationDirection == .left ? -1 : 1)
        case .ended:
            guard let pa = self.propertyAnimator else { return }
            if pa.fractionComplete > 0.33 {
                pa.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            } else {
                pa.isReversed = true
                pa.continueAnimation(withTimingParameters: nil, durationFactor: 0.5)
            }
        default:
            break
        }
    }
}
