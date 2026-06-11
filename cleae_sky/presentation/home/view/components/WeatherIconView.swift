//
//  WeatherIconView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//
import SwiftUI

struct WeatherIconView: View {
    let icon: String
    let size: CGFloat

    init(
        icon: String,
        size: CGFloat = 20
    ) {
        self.icon = icon
        self.size = size
    }

    private var isURL: Bool {
        icon.hasPrefix("http://") || icon.hasPrefix("https://")
    }

    var body: some View {
        Group {
            if isURL {
                AsyncImage(url: URL(string: icon)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()

                    case .failure(_):
                        placeholder

                    case .empty:
                        ProgressView()

                    @unknown default:
                        placeholder
                    }
                }
                .frame(width: size, height: size)

            } else {
                Image(systemName: icon)
                    .font(.system(size: size, weight: .medium))
                    .foregroundColor(.yellow)
            }
        }
    }

    private var placeholder: some View {
        Image(systemName: "cloud.fill")
            .font(.system(size: size))
            .foregroundColor(.white.opacity(0.5))
    }
}
