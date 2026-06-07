//
//  DashboardView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab : DashboardTabs = .home
    var body: some View {
        TabView(selection: $selectedTab){
            ForEach(DashboardTabs.allCases, id: \.self){
                tab in
                tab.view.tabItem{
                    Label(tab.title, systemImage: tab.icon)
                }.tag(tab)
            }
        }
    }
}

#Preview {
    DashboardView()
}
