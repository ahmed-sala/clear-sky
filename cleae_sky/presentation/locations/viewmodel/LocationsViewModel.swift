//
//  LocationsViewModel.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import Foundation
import Combine

@MainActor
final class LocationsViewModel: ObservableObject {

    @Published var searchText = ""
    @Published var searchResults: [SearchLocation] = []
    @Published var savedLocations: [SearchLocation] = []
    @Published var showDeleteAlert = false
    @Published var selectedLocation: SearchLocation?
    private let repository: LocationRepository

    init(repository: LocationRepository) {
        self.repository = repository
        loadSavedLocations()
    }

    func loadSavedLocations() {

        do {
            savedLocations = try repository.getSavedLocations()
        } catch {
            print(error)
        }
    }

    func search() async {

        guard !searchText.isEmpty else {
            searchResults = []
            return
        }

        do {
            searchResults = try await repository
                .searchLocations(query: searchText)
        } catch {
            print(error)
        }
    }

    func save(_ location: SearchLocation) {

        do {
            try repository.saveLocation(location)
            loadSavedLocations()
        } catch {
            print(error)
        }
    }

    func isSaved(_ location: SearchLocation) -> Bool {

        savedLocations.contains {
            $0.id == location.id
        }
    }
    func deleteSelectedLocation() {

        guard let location = selectedLocation else {
            return
        }

        do {

            try repository.deleteLocation(location)

            savedLocations.removeAll {
                $0.id == location.id
            }

        } catch {
            print(error)
        }

        selectedLocation = nil
    }
    func requestDelete(_ location: SearchLocation) {
        selectedLocation = location
        showDeleteAlert = true
    }
}
