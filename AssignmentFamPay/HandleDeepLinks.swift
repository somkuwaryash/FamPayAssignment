//
//  HandleDeepLinks.swift
//  AssignmentFamPay
//
//  Created by Yash Somkuwar on 04/02/24.
//

import Foundation
import SwiftUI

extension View {
    func onTapDeeplink(_ url: String?, _ action: @escaping () -> Void) -> some View {
        self.onTapGesture {
            if let deeplink = url, let url = URL(string: deeplink) {
                UIApplication.shared.openURL(url)
            }
            action()
        }
    }
}
