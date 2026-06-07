//
//  SplashView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import SwiftUI
import Lottie


struct SplashView: View {


    private enum Phase {
        case lottie
        case nameReveal
        case taglineReveal
        case holding
        case done
    }


    @State private var phase: Phase = .lottie

    @State private var lottieOpacity: Double = 1
    @State private var lottieScale: CGFloat  = 1

    @State private var lettersVisible: [Bool] = Array(repeating: false,
                                                       count: AppName.letters.count)
    @State private var taglineOpacity: Double = 0
    @State private var taglineOffset: CGFloat = 12

    var onFinished: () -> Void


    var body: some View {
        ZStack {

            background


            VStack(spacing: 0) {

                Spacer()

                if phase == .lottie || phase == .nameReveal {
                    LottieView(
                        animationName: "SplashAnimation",
                        loopMode: .playOnce,
                        onComplete: { startNameReveal() }
                    )
                    .frame(width: 200, height: 200)
                    .scaleEffect(0.7)
                        .opacity(lottieOpacity)
                        .scaleEffect(lottieScale)
                        .transition(.asymmetric(
                            insertion:  .opacity,
                            removal:    .opacity.combined(with: .scale(scale: 0.6))
                        ))
                }

                if phase != .lottie {
                    appNameView
                        .padding(.top, phase == .nameReveal ? 0 : 8)

                    Text("your sky, always clear")
                        .font(.custom("Georgia", size: 13))
                        .tracking(3)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color.white.opacity(0.55), Color.white.opacity(0.3)],
                                startPoint: .leading, endPoint: .trailing
                            )
                        )
                        .opacity(taglineOpacity)
                        .offset(y: taglineOffset)
                        .padding(.top, 10)
                }

                Spacer()

                bottomDot
                    .padding(.bottom, 48)
            }
        }
        .ignoresSafeArea()
        .onAppear { scheduleLottieFallback() }
    }

    // MARK: - Sub-views

    private var background: some View {
        ZStack {
            Color(red: 0.05, green: 0.08, blue: 0.18)
                .ignoresSafeArea()

            RadialGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.20, green: 0.45, blue: 0.85).opacity(0.45),
                    Color.clear
                ]),
                center: .init(x: 0.5, y: 0.15),
                startRadius: 0,
                endRadius: 380
            )

            RadialGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.55, green: 0.75, blue: 1.0).opacity(0.12),
                    Color.clear
                ]),
                center: .init(x: 0.5, y: 1.0),
                startRadius: 0,
                endRadius: 300
            )


        }
    }

    private var appNameView: some View {
        HStack(spacing: 1) {
            ForEach(Array(AppName.letters.enumerated()), id: \.offset) { index, char in
                Text(String(char))
                    .font(.custom("Georgia-BoldItalic", size: 46))
                    .foregroundStyle(letterGradient(for: index))
                    .shadow(color: Color(red: 0.4, green: 0.7, blue: 1.0).opacity(0.6),
                            radius: 12, x: 0, y: 0)
                    .opacity(lettersVisible[index] ? 1 : 0)
                    .offset(y:  lettersVisible[index] ? 0 : 22)
                    .scaleEffect(lettersVisible[index] ? 1 : 0.7,
                                 anchor: .bottom)
            }
        }
    }

    private var bottomDot: some View {
        HStack(spacing: 6) {
            ForEach(0..<3) { i in
                Circle()
                    .fill(Color.white.opacity(i == 1 ? 0.7 : 0.25))
                    .frame(width: i == 1 ? 7 : 4,
                           height: i == 1 ? 7 : 4)
            }
        }
        .opacity(taglineOpacity)
    }


    private func letterGradient(for index: Int) -> LinearGradient {
        let progress = Double(index) / Double(max(AppName.letters.count - 1, 1))
        let topColor    = Color(red: 0.85, green: 0.95, blue: 1.0)
        let bottomColor = Color(red: 0.50, green: 0.78, blue: 1.0)
        _ = progress          // available for per-letter tinting if desired
        return LinearGradient(colors: [topColor, bottomColor],
                              startPoint: .top, endPoint: .bottom)
    }


    private func scheduleLottieFallback() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            if phase == .lottie { startNameReveal() }
        }
    }

    private func startNameReveal() {
        guard phase == .lottie else { return }

        withAnimation(.easeIn(duration: 0.35)) {
            lottieOpacity = 0
            lottieScale   = 0.6
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation { phase = .nameReveal }

            // Stagger each letter
            for (i, _) in AppName.letters.enumerated() {
                let delay = Double(i) * 0.07
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    withAnimation(.spring(response: 0.5,
                                          dampingFraction: 0.65,
                                          blendDuration: 0)) {
                        lettersVisible[i] = true
                    }
                }
            }

            let totalLetterTime = Double(AppName.letters.count) * 0.07 + 0.4
            DispatchQueue.main.asyncAfter(deadline: .now() + totalLetterTime) {
                withAnimation(.easeOut(duration: 0.6)) {
                    taglineOpacity = 1
                    taglineOffset  = 0
                    phase          = .taglineReveal
                }
            }

            let holdDelay = totalLetterTime + 1.2
            DispatchQueue.main.asyncAfter(deadline: .now() + holdDelay) {
                phase = .done
                onFinished()
            }
        }
    }
}


private enum AppName {
    static let full    = "Cleae Sky"
    static let letters = Array(full)
}


#Preview {
    SplashView(onFinished: {})
}
