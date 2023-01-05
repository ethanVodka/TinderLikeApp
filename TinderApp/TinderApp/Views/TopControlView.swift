//
//  TopControlView.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/05.
//

import SwiftUI

struct TopControlView: View {
    //topControl項目
    enum SelectedItem{
        case Tinder, Topic, Message, Profile
    }
    @State var selectedItem: SelectedItem = .Tinder
    var offset: CGFloat = 20
    
    //画面幅
    private var framewidth: CGFloat{
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        HStack{
            
            Button(action: {//Tinderボタン
                selectedItem = .Tinder
            }, label: {
                Image(systemName: "flame.fill")
                    .asTopControlButtonView()
                    .foregroundColor(selectedItem == .Tinder ? .red: .gray)
            })
            .frame(width: framewidth / 4 - offset)
            .padding(.leading, offset)
            
            Button(action: {//ピックアップボタン
                selectedItem = .Topic
            }, label: {
                Image(systemName: "suit.diamond.fill")
                    .asTopControlButtonView()
                    .foregroundColor(selectedItem == .Topic ? .blue: .gray)
            })
            .frame(width: framewidth / 4)
            
            Button(action: {//メッセージボタン
                selectedItem = .Message
            }, label: {
                Image(systemName: "message.fill")
                    .asTopControlButtonView()
                    .foregroundColor(selectedItem == .Message ? .yellow: .gray)
            })
            .frame(width: framewidth / 4)
            
            Button(action: {//プロフィールボタン
                selectedItem = .Profile
            }, label: {
                Image(systemName: "person.crop.circle.fill")
                    .asTopControlButtonView()
                    .foregroundColor(selectedItem == .Profile  ? .black: .gray)
            })
            .frame(width: framewidth / 4 - offset)
            .padding(.trailing, offset)
            
        }
        .padding()
        .frame(width: framewidth)
        
    }
}
