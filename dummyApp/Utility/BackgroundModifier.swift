//
//  BackgroundModifier.swift
//  dummyApp
//
//  Created by denys pashkov on 25/04/24.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            content
        }
    }
}
