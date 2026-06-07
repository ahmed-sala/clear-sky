//
//  AppRootView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import SwiftUI


struct AppRootView: View {

    @State private var splashFinished = false

    var body: some View {
        ZStack {
            if splashFinished {

                DashboardView()
                    .transition(.opacity)
            } else {

                SplashView {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        splashFinished = true
                    }
                }
                .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: splashFinished)
    }
}


#Preview {
    AppRootView()
}
