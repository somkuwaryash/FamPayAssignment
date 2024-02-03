//
//  CardGroupView.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 03/02/24.
//

import SwiftUI

struct CardGroupView: View {
    var cardGroup: CardGroup

    var body: some View {
        VStack(spacing: 0) {
            switch cardGroup.design_type {
            case .SMALL_DISPLAY_CARD:
                SmallDisplayCardView(cardGroup: cardGroup)
            case .BIG_DISPLAY_CARD:
                BigDisplayCardView(cardGroup: cardGroup)
            case .IMAGE_CARD:
                ImageCardView(cardGroup: cardGroup)
            case .SMALL_CARD_WITH_ARROW:
                SmallCardWithArrowView(cardGroup: cardGroup)
            case .DYNAMIC_WIDTH_CARD:
                DynamicWidthCardView(cardGroup: cardGroup)
            }
        }
        .padding()
    }
}



//#Preview {
//    CardGroupView()
//}
