//
//  WeatherIconView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//
import SwiftUI

struct WeatherIconView: View {
    let icon: String

    private var isURL: Bool {
        icon.hasPrefix("http://") || icon.hasPrefix("https://")
    }

    var body: some View {
        Group {
            if isURL {
                AsyncImage(url: URL(string: icon)) { phase in
                    switch phase {
                    case .success(let img):
                        img.resizable().scaledToFit()
                    default:
                        Image(systemName: "cloud.fill")
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            } else {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.yellow)
            }
        }
    }
}
