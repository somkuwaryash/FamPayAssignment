//
//  SmallCardWithArrowView.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 03/02/24.
//

import SwiftUI

struct SmallCardWithArrowView: View {
    var cardGroup: CardGroup

    var body: some View {
        VStack(spacing: 8) {
            if cardGroup.is_scrollable {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(cardGroup.cards) { card in
                            smallCardWithArrowContent(for: card)
                        }
                    }
                }
            } else {
                smallCardWithArrowContent(for: cardGroup.cards.first)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }

    private func smallCardWithArrowContent(for card: Card?) -> some View {
        Group {
            if let card = card {
                Text(card.formatted_title?.text ?? card.title ?? "")
                    .font(.headline)
                    .foregroundColor(.black)

                Text(card.formatted_description?.text ?? card.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                HStack {
                    Spacer()

                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

//#Preview {
//    SmallCardWithArrowView()
//}
