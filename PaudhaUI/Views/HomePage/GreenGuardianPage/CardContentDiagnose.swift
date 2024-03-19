//
//  CardContentDiagnose.swift
//  PaudhaUI
//
//  Created by Anant Narain on 18/01/24.
//

import SwiftUI

struct CardContentDiagnose: View {
    @State private var cards: [CardModel] = [
        CardModel(title: "Symptoms", content: """
            - Dark, water-soaked spots on leaves
            - Rapidly enlarging, brown-black lesions with yellow halos
            - Curly withering dying leaves
            - White fuzzy growth on leaf undersides
        """),
        CardModel(title: "Causes", content: """
            - High humidity and cool, moist weather favor late blight development.
            - Phytophthora infestans, the pathogen, survives in infected plant debris and soil.
            - Inadequate or poorly applied fungicides leave crops vulnerable.
            - Improper irrigation practices, like overhead watering, encourage disease spread.
        """),
        CardModel(title: "Preventive Measures", content: """
            - Plant Resistant Varieties: Choose potato varieties that have resistance to late blight.
            - Crop Rotation: Rotate potato crops with non-host crops to break the disease cycle.
            - Field Sanitation: Remove and destroy infected plant debris promptly. Avoid planting in fields with a history of late blight.
            - Proper Spacing: Plant potatoes with adequate spacing to improve air circulation.
            - Fungicide Application: Implement a preventive fungicide program, especially during periods of high risk.
            - Irrigation Practices: Use drip irrigation or other methods that minimize leaf wetness.
        """),
        CardModel(title: "Necessary Actions", content: """
            - Isolate infected areas to prevent further spread.
            - If late blight is confirmed, apply fungicides promptly according to recommended guidelines.
            - Stay informed about local weather conditions that favor late blight.
            - Implement a regular surveillance program to monitor for signs of late blight.
            - Maintain records of field history, treatments, and disease occurrences for future planning.
        """)
        
        // Add more CardModels for other details...
    ]
    
    var body: some View {
        VStack {
            
            VStack{
                 Text("Best Results...").font(.system(size:20, weight:.bold,design: .default)).foregroundColor(Color("bestResults"))
                 
                 Image("diagnose")
                     .resizable()
                     .frame(width: 250, height: 200)
                     .cornerRadius(27)
//                         .overlay(
//                             Button(action: {
//                                 // Handle button action
//                             }) {
//                                 Image("addToCollection")
//                                     .resizable()
//                                     .aspectRatio(contentMode: .fill)
//                                     .frame(width: 73, height: 73)
//                                     .cornerRadius(50).offset(x: 130,y: 140)
//                             }
//                         )
                 
                Text("Uh oh...looks like your buddy has..").italic()
                Text("Potato Late Blight").font(.system(size: 20, weight: .heavy))
             }
            Text("Overview")


            // Integrate the SwipeableCardStackView
            SwipeableCardStackView(cards: $cards)
        }
        .padding()
    }
}

#Preview {
    CardContentDiagnose()
}
