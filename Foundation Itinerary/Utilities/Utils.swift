//
//  Utils.swift
//  Foundation Itinerary
//
//  Created by Ayush Bhople on 28/11/25.
//

import SwiftUI
import MapKit
import os

extension Foundation_ItineraryApp {
    static let minimumLandmarkWidth: CGFloat = 60.0

    static var maximumFullGridWidth: CGFloat {
        return minimumLandmarkWidth * 4.0 + (5 * Padding.landmarkGrid)
    }
    
    struct Padding {
        static let standard: CGFloat = 20.0
        static let matchesNavigationTitle: CGFloat = 26.0
        static let landmarkGrid: CGFloat = 8.0
        static let collectionGrid: CGFloat = 8.0
    }
}

struct ReadabilityRoundedRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16.0)
            .fill(
                LinearGradient(
                    colors: [.black.opacity(0.8), .clear],
                    startPoint: .bottom,
                    endPoint: .center
                )
            )
    }
}
