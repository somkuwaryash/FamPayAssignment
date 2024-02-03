//
//  DynamicWidthCardView.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 03/02/24.
//

import SwiftUI

struct DynamicWidthCardView: View {
    var cardGroup: CardGroup

    var body: some View {
        VStack(spacing: 8) {
            if let card = cardGroup.cards.first {
                Text(card.formatted_title?.text ?? card.title ?? "")
                    .font(.headline)
                    .foregroundColor(.black)
            }

            if let card = cardGroup.cards.first {
                Text(card.formatted_description?.text ?? card.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }

            if let cta = cardGroup.cards.first?.cta, !cta.isEmpty {
                HStack(spacing: 16) {
                    ForEach(cta) { action in
                        Button(action.text) {
                            
                        }
                        .padding()
                        .foregroundColor(Color(action.text_color ?? "") ?? .blue)
                        .background(Color(action.bg_color ?? "") ?? .clear)
                        .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

//#Preview {
//    DynamicWidthCardView()
//}
