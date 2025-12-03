<!-- ========================================================= -->
<!--               🎥 VIDEO DEMO PLACEHOLDER                   -->
<!--  Add GIF / YouTube link / .mp4 preview here later         -->
<!-- ========================================================= -->

<p align="center">
  <img src="" alt="Demo coming soon..." width="400"/>
</p>

<br/>

<div align="center">

# 🗺️ Generative Itinerary Planner  
### Powered by Apple’s **Foundation Models Framework**

<br/>

[![Swift](https://img.shields.io/badge/Swift-5.10-orange?logo=swift)]()
[![iOS](https://img.shields.io/badge/iOS-18.0-blue?logo=apple)]()
[![SwiftUI](https://img.shields.io/badge/SwiftUI-Enabled-teal?logo=swift)]()
[![LLM](https://img.shields.io/badge/On–Device%20LLM-Foundation%20Models-8A2BE2)]()

</div>

---

## 📌 Overview

This project demonstrates a fully native iOS app that leverages **Apple’s on-device LLM** through the **Foundation Models framework**.  
It generates travel itineraries, structured Swift models, streaming content, and real points of interest using **model tool-calling** — all running securely on-device.

The app uses **SwiftUI + MVVM**, `@Generable` typed models, `PromptBuilder`, streaming responses, and a custom LLM Tool (`FindPointsOfInterestTool`) to create an advanced generative experience.

---

## 🚀 Features

### 🔥 Core Capabilities
- On-device **large language model** integration with `LanguageModelSession`
- Dynamic, persona-based instructions for consistent outputs
- Type-safe generative data using **@Generable** Swift structs
- Responsive UI with **streaming generation** and partial updates
- **Tool Calling**: LLM can autonomously invoke Swift functions (POI lookup)
- MapKit integration for real-time locations
- Optimized prompting + model pre-warming

---

## 🏛️ Architecture

```text
SwiftUI App
   └── ViewModels/
         └── ItineraryGenerator.swift   (LLM session, prompts, streaming)
         └── FindPointsOfInterestTool.swift (Tool calling)
   └── Views/
         ├── LandmarkTripView.swift
         ├── ItineraryView.swift
         └── Supporting components
   └── Models/
         └── Itinerary (Generable)
         └── DayPlan (Generable)
         └── Activity (Generable)
```

## 🧠 Foundation Models Integration

### **Structured Output**

The model generates real Swift types:

```swift
let response = try await session.respond(
    to: prompt,
    generating: Itinerary.self
)
```

### **Dynamic Prompting**

```swift
let prompt = Prompt {
    "Generate a 3-day itinerary to \(landmark.name)."
    "Here is an example of the desired format:"
    Itinerary.exampleTripToJapan
}
```

### **Streaming Responses**

```swift
let stream = session.streamResponse(
    to: prompt,
    generating: Itinerary.self,
    options: GenerationOptions(sampling: .greedy),
    includeSchemaInPrompt: false
)

for try await partial in stream {
    self.itinerary = partial.content
}
```

### **Tool Calling**

```swift
struct FindPointsOfInterestTool: Tool {
    let name = "findPointsOfInterest"
    let description = "Finds hotels or restaurants near a landmark."

    struct Arguments: Generable {
        @Guide(description: "The type of point of interest to look for.")
        let pointOfInterest: Category
    }

    func call(arguments: Arguments) async throws -> String {
        let results = await getSuggestions(
            category: arguments.pointOfInterest
        )
        return "Here are some options: \(results.joined(separator: \", \"))"
    }
}
```


## 📱 Screens & Flow
- Pick a landmark
- Model availability check
- Generate itinerary (button)
- Streaming UI displays trip in real-time
- Tool calling enriches data with POI lookups
- Rendered itinerary view with maps & activity lists


## ⚡ Performance Optimizations
- Pre-warming the LLM on app launch
- Removed unnecessary schema from prompts
- One-shot examples reduce hallucination
- Greedy sampling for deterministic tool-calling behavior


## 📥 Installation
```bash
git clone <your-repo-url>
cd GenerativeItineraryPlanner
open FoundationModelsCodeAlong.xcodeproj
```

## Requirements
- Xcode 16+
- iOS/macOS with Apple Intelligence support
- Swift 5.10+
- Apple Developer account (for signing)


## 🛣️ Future Enhancements
- Replace mock POI data with real MapKit Look Around or API
- Add caching for generation sessions
- Add offline itinerary templates
- Add multilingual support
- Export itineraries as PDF


## 📄 License
MIT License. Free to modify and use.


## ⭐ Support
If you find this project useful, please consider giving a star to the repository!
