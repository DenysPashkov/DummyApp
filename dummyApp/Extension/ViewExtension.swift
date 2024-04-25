//
//  ViewExtension.swift
//  dummyApp
//
//  Created by denys pashkov on 25/04/24.
//

import SwiftUI

extension View {
    func backgroundColor() -> some View {
        self.modifier(BackgroundModifier())
    }
}
