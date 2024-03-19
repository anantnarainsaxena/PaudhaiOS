//
//  SwipeableCardStackView.swift
//  PaudhaUI
//
//  Created by Anant Narain on 18/01/24.
//

import SwiftUI

struct SwipeableCardStackView: View {
    @Binding var cards: [CardModel]

    var body: some View {
        CardStackView(cards: $cards)
    }
}
