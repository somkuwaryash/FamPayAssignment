//
//  ImageCardView.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 03/02/24.
//

import SwiftUI

struct ImageCardView: View {
    var cardGroup: CardGroup

    var body: some View {
        VStack(spacing: 8) {
            if cardGroup.is_scrollable {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(cardGroup.cards) { card in
                            imageCardContent(for: card)
                        }
                    }
                }
            } else {
                imageCardContent(for: cardGroup.cards.first)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }

    private func imageCardContent(for card: Card?) -> some View {
        Group {
            if let card = card {
                if let imageUrl = card.bg_image?.image_url {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        ProgressView()
                    }
                }

                Text(card.formatted_title?.text ?? card.title ?? "")
                    .font(.headline)
                    .foregroundColor(.black)

                Text(card.formatted_description?.text ?? card.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                if let cta = card.cta, !cta.isEmpty {
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
        }
    }
}

//#Preview {
//    ImageCardView()
//}
