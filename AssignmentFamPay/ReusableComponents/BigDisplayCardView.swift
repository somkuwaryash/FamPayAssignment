//
//  BigDisplayCardView.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 03/02/24.
//

import SwiftUI

struct BigDisplayCardView: View {
    var cardGroup: CardGroup

    @State private var isActionSheetPresented = false

    var body: some View {
        VStack(spacing: 16) {
            Text("Big Display Card")
                .font(.title)
                .foregroundColor(.black)

            if cardGroup.is_scrollable {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(cardGroup.cards) { card in
                            bigDisplayCardContent(for: card)
                        }
                    }
                }
            } else {
                bigDisplayCardContent(for: cardGroup.cards.first)
            }

            HStack {
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }

    private func bigDisplayCardContent(for card: Card?) -> some View {
        Group {
            if let card = card {
                Text(card.formatted_title?.text ?? card.title ?? "")
                    .font(.headline)
                    .foregroundColor(.gray)

                if let imageUrl = card.bg_image?.image_url {
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .onLongPressGesture {
                                isActionSheetPresented = true
                            }
                    } placeholder: {
                        ProgressView()
                    }
                }

                HStack {
                    Button("Remind Later") {
                        isActionSheetPresented = false
                    }
                    .foregroundColor(.blue)

                    Spacer()

                    Button("Dismiss Now") {
                        isActionSheetPresented = false
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}
//#Preview {
//    BigDisplayCardView()
//}
