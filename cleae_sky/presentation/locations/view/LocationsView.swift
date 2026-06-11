//
//  LocationsView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import SwiftUI

struct LocationsView: View {

    @StateObject var viewModel: LocationsViewModel

    var backgroundImageName: String {
        TimeHelper.backgroundImageName()
    }

    var body: some View {

        NavigationStack {

            ZStack {

                BackgroundView(
                    imageName: backgroundImageName
                )

                LocationsContentView(
                    viewModel: viewModel
                )
            }
            .navigationTitle("Locations")
            .navigationBarTitleDisplayMode(.large)
        }
        .preferredColorScheme(.dark)
        .searchable(
            text: $viewModel.searchText,
            prompt: "Search city"
        )
        .onChange(of: viewModel.searchText) {

            Task {
                await viewModel.search()
            }
        }
        .alert(
            "Delete Location",
            isPresented: $viewModel.showDeleteAlert
        ) {

            Button(
                "Delete",
                role: .destructive
            ) {
                viewModel.deleteSelectedLocation()
            }

            Button(
                "Cancel",
                role: .cancel
            ) { }

        } message: {

            Text(
                "Are you sure you want to remove this location?"
            )
        }
    }
}
