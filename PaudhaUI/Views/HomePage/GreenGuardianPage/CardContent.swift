//
//  CardContent.swift
//  PaudhaUI
//
//  Created by Anant Narain on 18/01/24.
//

import SwiftUI

struct CardContent: View {
    @State private var cards: [CardModel] = [
        CardModel(title: "Features", content: "Air-purifying\nEasy\nTall\nTrendy"),
        CardModel(title: "Description", content: "The Pothos, or Epipremnum aureum, has the reputation of being one of the easiest houseplants to take care of. ----- the Pothos Marble Queen, featuring deeper green and white variegation."),
        CardModel(title: "Important Information", content: "Genus: epipremnum\nCommon name: ivy arum, Ceylon creeper\nScientific Name: Epipremnum aureum"),
        CardModel(title: "Watering", content: "Water your Pothos every 1-2 weeks, allowing soil to dry out between waterings. Expect to water more often in brighter light and less often in lower light. Some signs of overwatering include yellowing leaves and black stems, while underwatered plants will wilt and their potting mix will dry out."),
        CardModel(title: "Temperature", content: "Most houseplants prefer temperatures in the 65°F-85°F range (18°C-30°C)..."),
        // Add more CardModels for other details...
    ]
    
    
    var body: some View {
        VStack {
            
            VStack{
                 Text("Best Results...").font(.system(size:20, weight:.bold,design: .default)).foregroundColor(Color("bestResults"))
                 
                 Image("identify")
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
                 
                 Text("Golden Pothos").font(.system(size: 20,weight: .bold))
                 Text("(Epipremnum aureum)").italic().font(.system(size: 15,weight: .medium))
                 
             }
            Text("Overview")


            // Integrate the SwipeableCardStackView
            SwipeableCardStackView(cards: $cards)
        }
        .padding()
    }
}
