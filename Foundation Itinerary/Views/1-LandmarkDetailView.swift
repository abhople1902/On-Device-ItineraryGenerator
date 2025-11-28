//
//  1-LandmarkDetailView.swift
//  Foundation Itinerary
//
//  Created by Ayush Bhople on 28/11/25.
//

import FoundationModels
import SwiftUI

struct LandmarkDetailView: View {
    let landmark: Landmark
    
    private let model = SystemLanguageModel.default

    var body: some View {
        switch model.availability {
        case .available:
            LandmarkTripView(landmark: landmark)
            
        case .unavailable:
            MessageView(
                landmark: self.landmark,
                message: """
                         Trip Planner is unavailable because \
                         Apple Intelligence has not been turned on.
                         """
            )
        @unknown default:
            MessageView(
                landmark: self.landmark,
                message: """
                         Trip Planner is unavailable. Try again later.
                         """
            )
        }
    }
}
