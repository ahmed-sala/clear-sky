//
//  HomeView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//
import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {

            Image(viewModel.backgroundImageName)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.black.opacity(0.4)
                .ignoresSafeArea()

            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
