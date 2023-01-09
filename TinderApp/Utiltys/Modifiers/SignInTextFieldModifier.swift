//
//  SignInTextFieldModifier.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/08.
//

import SwiftUI

struct SignInTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(PlainTextFieldStyle())
            .frame(height: 50)
            .padding(.leading, 10)
            .background(Color.white)
            .cornerRadius(5)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color(.init(white: 0.85, alpha: 1))))
    }
}
