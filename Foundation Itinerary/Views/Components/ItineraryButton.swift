//
//  ItineraryButton.swift
//  Foundation Itinerary
//
//  Created by Ayush Bhople on 28/11/25.
//

import SwiftUI

struct ItineraryButton: View {
    @State private var showButton: Bool = false
    let closure: () async throws -> Void

    var body: some View {
        VStack {
            Button {
                showButton = false
                Task { @MainActor in
                    try await closure()
                }
            }
            label: {
                Label("Generate Itinerary", systemImage: "sparkles")
                    .fontWeight(.bold)
                    .padding()
            }
            .buttonStyle(.bordered)
            .padding()
            .opacity(showButton ? 1 : 0)
            .animation(
                .easeInOut(duration: 0.5),
                value: showButton
            )
            .onAppear {
                showButton = true
            }
            .transition(.opacity)
        }
        .frame(maxWidth: .infinity, alignment: .bottom)
    }
}
