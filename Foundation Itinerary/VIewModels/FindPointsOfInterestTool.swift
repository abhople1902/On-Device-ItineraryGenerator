//
//  FindPointsOfInterestTool.swift
//  Foundation Itinerary
//
//  Created by Ayush Bhople on 28/11/25.
//

import FoundationModels
import SwiftUI

@Observable
final class FindPointsOfInterestTool: Tool {
    
    let name = "findPointsOfInterest"
    let description = "Finds points of interest for a landmark."
    
    let landmark: Landmark
    init(landmark: Landmark) {
        self.landmark = landmark
    }

    @Generable
    struct Arguments {
        @Guide(description: "This is the type of business to look up for.")
        let pointOfInterest: Category
    }
    
    func call(arguments: Arguments) async throws -> String {
        let results = await getSuggestions(category: arguments.pointOfInterest,
                                                    landmark: landmark.name)
        return """
            There are these \(arguments.pointOfInterest) in \(landmark.name): 
            \(results.joined(separator: ", "))
        """
    }
    
}

@Generable
enum Category: String, CaseIterable {
    case hotel
    case restaurant
}

func getSuggestions(category: Category, landmark: String) -> [String] {
    switch category {
    case .hotel : ["Four Seasons Resort", "Apukka Resort", "The Grand Palazzo"]
    case .restaurant : ["Zama Local Thai Restaurant", "Royal Tandoor", "99 Sushi Bar"]
    }
}
