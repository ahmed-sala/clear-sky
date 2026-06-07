//
//  DashboardTabs.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//
import SwiftUI

enum DashboardTabs : String, CaseIterable{
    case home
    case locations

    var title : String {
        switch self{
        case .home : return "Home"
        case .locations : return "Locations"
        }
    }
    var icon : String {
        switch self {
        case .home : return "house"
        case .locations : return "mappin.and.ellipse"
        }
    }
    var view: AnyView {
        switch self{
        case .home : return AnyView(HomeView(viewModel: DIContainer.shared.makeHomeViewModel()))
        case .locations : return AnyView(LocationsView())
        }
    }
}
