//
//  PlantDetailView1.swift
//  PaudhaUI
//
//  Created by SHHH!! private on 06/03/24.
//

import SwiftUI

struct PlantDetailView1: View {
    let plant: Plant1
    
    var body: some View {
        NavigationView {
            VStack {
                Image(plant.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 250)
                    .cornerRadius(20)
                    .padding()
                
                Text(plant.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Card {
                    Text(plant.info)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                Spacer()
            }
            .padding(.vertical)
            .navigationBarTitle("Plant Details", displayMode: .inline)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.9686, green: 0.8824, blue: 0.8431), Color(red: 240/255.0, green: 255/255.0, blue: 241/255.0)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}
struct Card<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
    }
}

