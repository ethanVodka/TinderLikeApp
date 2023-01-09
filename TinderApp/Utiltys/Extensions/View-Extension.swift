//
//  View-Extension.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/05.
//

import SwiftUI

//Viewクラス拡張
extension View{
    func asRoundShadow(size: CGFloat) -> some View{
        modifier(BottomButtonModifire(size: size))
    }
    
    func asSignInTextField() -> some View{
        modifier(SignInTextFieldModifier())
    }
}
