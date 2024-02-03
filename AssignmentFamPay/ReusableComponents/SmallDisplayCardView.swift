//
//  SmallDisplayCardView.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 03/02/24.
//

import SwiftUI

struct SmallDisplayCardView: View {
    var cardGroup: CardGroup

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(cardGroup.name)
                .font(.headline)
                .foregroundColor(.black)

            if cardGroup.is_scrollable {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(cardGroup.cards) { card in
                            cardContent(for: card)
                        }
                    }
                }
            } else {
                cardContent(for: cardGroup.cards.first)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .shadow(radius: 4)
    }

    private func cardContent(for card: Card?) -> some View {
        Group {
            if let card = card {
                Text(card.formatted_title?.text ?? card.title ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                if let imageUrl = card.icon?.image_url {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        }
    }
}

//#Preview {
//    SmallDisplayCardView()
//}
