//
//  HomeBackgroundView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//



import SwiftUI

struct HomeBackgroundView: View {

    let imageName: String

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.black.opacity(0.35)
                .ignoresSafeArea()
        }
    }
}
