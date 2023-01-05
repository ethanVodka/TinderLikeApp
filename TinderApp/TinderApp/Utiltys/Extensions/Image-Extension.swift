//
//  Image-Extension.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/05.
//

import SwiftUI

//Imageクラス拡張
extension Image{
    func asTopControlButtonView() -> some View{
        self
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40, alignment: .center)
    }
}
