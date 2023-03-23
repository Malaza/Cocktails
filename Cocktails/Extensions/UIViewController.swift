//
//  UIViewController.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/22.
//

import UIKit
import Foundation
import Lottie

private var animationView: LottieAnimationView?

extension UIViewController {
    
    func showLoadingView() {
        animationView = .init(name: "drink")
        animationView?.backgroundColor = .white
        animationView!.frame = self.view.bounds
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.4
        self.view.addSubview(animationView!)
        animationView!.play()
    }
    
    func hideLoadingView() {
        animationView?.stop()
        animationView?.removeFromSuperview()
    }
}
