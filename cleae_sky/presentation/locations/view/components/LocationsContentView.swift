//
//  LocationsContentView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct LocationsContentView: View {

    @ObservedObject var viewModel: LocationsViewModel

    var body: some View {

        List {

            Color.clear
                .frame(height: 45)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)

            if viewModel.searchText.isEmpty {

                if viewModel.savedLocations.isEmpty {

                    EmptyLocationsView()
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)

                } else {

                    ForEach(viewModel.savedLocations) { location in

                        NavigationLink {

                            HomeView(
                                viewModel: DIContainer.shared.makeHomeViewModel(),
                                cityLat: location.latitude,
                                cityLon: location.longitude
                            )

                        } label: {

                            LocationCardView(
                                location: location,
                                isSaved: true
                            )
                        }
                        .buttonStyle(.plain)
                        .swipeActions(edge: .trailing) {

                            Button {
                                viewModel.requestDelete(location)
                            } label: {
                                Label(
                                    "Delete",
                                    systemImage: "trash"
                                )
                            }
                            .tint(.red)
                        }
                        .listRowInsets(
                            EdgeInsets(
                                top: 6,
                                leading: 16,
                                bottom: 6,
                                trailing: 16
                            )
                        )
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                }

            } else {

                ForEach(viewModel.searchResults) { location in

                    Button {

                        viewModel.save(location)

                    } label: {

                        LocationCardView(
                            location: location,
                            isSaved: viewModel.isSaved(location)
                        )
                    }
                    .buttonStyle(.plain)
                    .listRowInsets(
                        EdgeInsets(
                            top: 6,
                            leading: 16,
                            bottom: 6,
                            trailing: 16
                        )
                    )
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(.clear)
        .environment(\.defaultMinListRowHeight, 1)
    }
}
