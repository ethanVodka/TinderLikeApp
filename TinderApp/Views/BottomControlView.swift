//
//  BottomControlView.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/05.
//

import SwiftUI

struct BottomControlView: View{
    //画面幅
    private var framewidth: CGFloat{
        UIScreen.main.bounds.width
    }
    
    var body: some View{
        
        HStack(spacing: 20){
            //リロードボタン
            BottomButtonView(imageName: "reload", imageSize: 25, backgraoundSize: 60)
            //拒否ボタン
            BottomButtonView(imageName: "nope", imageSize: 20, backgraoundSize: 50)
            //スーパーライクボタン
            BottomButtonView(imageName: "superlike", imageSize: 25, backgraoundSize: 60)
            //ライクボタン
            BottomButtonView(imageName: "like", imageSize: 20, backgraoundSize: 50)
            //ブーストボタン
            BottomButtonView(imageName: "boost", imageSize: 25, backgraoundSize: 60)
        }
        .frame(width: framewidth)
        .padding()
    }
}

struct BottomButtonView: View{
    
    var imageName: String
    var imageSize: CGFloat
    var backgraoundSize: CGFloat
    
    var body: some View{
        ZStack{
           Color.white
                .asRoundShadow(size: backgraoundSize)
            Button(action:{
                
            }, label:{
                    Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize, alignment: .center)
            })
        }
    }
}
