//
//  BottomButtonModifier.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/05.
//

import SwiftUI

//カスタムmodifier
struct BottomButtonModifire: ViewModifier{    
    var size: CGFloat
    
    func body(content: Content) -> some View{
        content
            .frame(width: size, height: size)
            .cornerRadius(size)
            .shadow(radius: 10)
    }
}
