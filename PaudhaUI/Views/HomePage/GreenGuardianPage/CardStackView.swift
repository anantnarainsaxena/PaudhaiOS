//
//  CardStackView.swift
//  PaudhaUI
//
//  Created by Anant Narain on 18/01/24.
//

import SwiftUI

struct CardStackView: View {
    @Binding var cards: [CardModel]
    @State private var currentIndex = 0
    @State private var offset: CGSize = .zero
    let cardWidth: CGFloat = 300
    let cardHeight: CGFloat = 230
    
    
    
    let horizontalSpacing: CGFloat = 20
    var body: some View {
        ZStack {
            ForEach(cards.indices) { index in
                VStack {
                    Text(cards[index].title)
                    
                        .font(.system(size: 18))
                        .foregroundColor(Color.green)
                    
                    Text(cards[index].content)
                    
                        .font(.system(size: 17))
                        .multilineTextAlignment(.leading)
                }
                .padding(20) // Add padding to separate content from card edges
                .frame(width: cardWidth, height: cardHeight)
                .background(Color.white) // Maintain card color
                .cornerRadius(16)
                .shadow(radius: 8)
                .overlay(
                                    VStack {
                                        Spacer()
                                        Image(systemName: "arrow.up")
                                            .font(.system(size: 15)) // Adjust the size
                                            .foregroundColor(.gray) // Change the color
                                            .opacity(0.3 + 0.7 * abs(Double(offset.height / 50))) // Flickering effect
                                            .padding(.bottom, 8)
                                    }
                                )
                .offset(y: CGFloat(index) * 10)
                //.rotationEffect(.degrees(Double(index - currentIndex) * 5)) // Add rotation effect
                //.opacity(index == currentIndex ? 1 : 0.7) // Adjust opacity for other cards
                
                .zIndex(Double(index))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation
                        }
                        .onEnded { value in
                            //  let cardHeight = CGFloat(400)
                            let offsetThreshold = cardHeight / 2
                            
                            withAnimation {
                                // Check if the drag offset is greater than half the card height
                                if value.translation.height > offsetThreshold {
                                    currentIndex += 1
                                    let removedCard = cards.removeFirst()
                                    cards.append(removedCard)
                                } else if value.translation.height < -offsetThreshold {
                                    currentIndex -= 1
                                    let removedCard = cards.removeLast()
                                    cards.insert(removedCard, at: 0)
                                }
                                
                                offset = .zero
                            }
                        }
                    
                )
                
            }
            .padding()
        }
    }
    
    
    }
