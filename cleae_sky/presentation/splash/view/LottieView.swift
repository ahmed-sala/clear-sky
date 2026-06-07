//
//  LottieView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//


import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {


    let animationName: String
    let loopMode: LottieLoopMode
    var animationSpeed: CGFloat = 1.0
    var onComplete: (() -> Void)?


    func makeUIView(context: Context) -> LottieAnimationView {
        let view = LottieAnimationView(name: animationName)
        view.loopMode          = loopMode
        view.animationSpeed    = animationSpeed
        view.contentMode       = .scaleAspectFit
        view.backgroundBehavior = .pauseAndRestore

        view.play { finished in
            if finished { onComplete?() }
        }

        return view
    }

    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
    }
}
