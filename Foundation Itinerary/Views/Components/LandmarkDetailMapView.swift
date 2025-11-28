//
//  LandmarkDetailMapView.swift
//  Foundation Itinerary
//
//  Created by Ayush Bhople on 28/11/25.
//

import SwiftUI
import MapKit

struct LandmarkDetailMapView: View {
    let landmark: Landmark
    var landmarkMapItem: MKMapItem?

    var body: some View {
        Map(initialPosition: .region(landmark.coordinateRegion), interactionModes: []) {
            if let landmarkMapItem = landmarkMapItem {
                Marker(item: landmarkMapItem)
            }
        }
        .disabled(true)
    }
}
