//
//  ModelData.swift
//  Foundation Itinerary
//
//  Created by Ayush Bhople on 28/11/25.
//

import Foundation
@preconcurrency import MapKit
import CoreLocation
import Synchronization

@Observable
class ModelData {
    @MainActor
    static let shared = ModelData()
    nonisolated static let landmarks: [Landmark] = parseLandmarks(fileName: "landmarkData.json")
    nonisolated static var landmarkNames: [String] {
        landmarks.map(\.name)
    }
    
    static func parseLandmarks(fileName: String) -> [Landmark] {
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }

        do {
            let data: Data = try Data(contentsOf: file)
            let decoder = JSONDecoder()
            return try decoder.decode([Landmark].self, from: data)
        } catch {
            fatalError("Couldn't parse \(fileName):\n\(error)")
        }
    }
}
