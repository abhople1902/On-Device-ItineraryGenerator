//
//  Foundation_ItineraryApp.swift
//  Foundation Itinerary
//
//  Created by Ayush Bhople on 28/11/25.
//

import SwiftUI

@main
struct Foundation_ItineraryApp: App {
    private var modelData = ModelData.shared
    
    var body: some Scene {
        WindowGroup {
            LandmarksHomeView()
                .environment(modelData)
                #if os(macOS)
                .frame(width: 500, height: 800)
                #endif
        }
        #if os(macOS)
        .windowResizability(.contentSize)
        #endif
    }
}
