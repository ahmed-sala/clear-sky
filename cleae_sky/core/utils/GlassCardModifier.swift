//
//  GlassCardModifier.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct GlassCardModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .background(Color.black.opacity(0.15))
            .background(.ultraThinMaterial)
            .environment(\.colorScheme, .dark)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 24,
                    style: .continuous
                )
            )
            .overlay(
                RoundedRectangle(
                    cornerRadius: 24,
                    style: .continuous
                )
                .strokeBorder(
                    Color.white.opacity(0.2),
                    lineWidth: 0.5
                )
            )
    }
}

extension View {
    func glassCardStyle() -> some View {
        modifier(GlassCardModifier())
    }
}
