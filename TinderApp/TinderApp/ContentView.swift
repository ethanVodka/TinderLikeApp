//
//  ContentView.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/05.
//

import SwiftUI

struct ContentView: View {
    
    //ヘッダー選択項目
    enum SelectedItem{
        case Tinder, Topic, Message, Profile
    }
    
    @State var selectedItem: SelectedItem = .Tinder
    //画面幅
    private var framewidth: CGFloat{
        UIScreen.main.bounds.width
    }
    private var imageheight: CGFloat{
        UIScreen.main.bounds.height * 0.7
    }
    
    var body: some View {
        VStack {
            //ヘッダーボタン設定
            HStack{
                //Tinderボタン
                Button(action: {
                    selectedItem = .Tinder
                }, label: {
                    Image(systemName: "flame.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(selectedItem == .Tinder ? .red: .gray)
                })
                .frame(width: framewidth / 4 - 20)
                .padding(.leading, 30)
                //ピックアップボタン
                Button(action: {
                    selectedItem = .Topic
                }, label: {
                    Image(systemName: "suit.diamond.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(selectedItem == .Topic ? .red: .gray)
                })
                .frame(width: framewidth / 4)
                
                //メッセージボタン
                Button(action: {
                    selectedItem = .Message
                }, label: {
                    Image(systemName: "message.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(selectedItem == .Message ? .red: .gray)
                })
                .frame(width: framewidth / 4)
                
                //プロフィールボタン
                Button(action: {
                    selectedItem = .Profile
                }, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(selectedItem == .Profile  ? .red: .gray)
                })
                .frame(width: framewidth / 4 - 20)
                .padding(.trailing, 30)
                
            }
            .padding()
            .frame(width: framewidth)
            
            //画像表示領域
            Text("Sample")
                .padding()
                .frame(width: framewidth, height: imageheight)
                .background(Color.red)
            
            //フッター領域
            HStack(spacing: 20){
                //リロードボタン
                FooterButtonView(imageName: "reload", imageSize: 25, backgraoundSize: 60)
                //拒否ボタン
                FooterButtonView(imageName: "nope", imageSize: 20, backgraoundSize: 50)
                //スーパーライクボタン
                FooterButtonView(imageName: "superlike", imageSize: 25, backgraoundSize: 60)
                //ライクボタン
                FooterButtonView(imageName: "like", imageSize: 20, backgraoundSize: 50)
                //ブーストボタン
                FooterButtonView(imageName: "boost", imageSize: 25, backgraoundSize: 60)
            }
        }
        .padding()
        .frame(width: framewidth)
    }
}
//フッターボタン作成
struct FooterButtonView: View{
    
    var imageName: String
    var imageSize: CGFloat
    var backgraoundSize: CGFloat
    
    var body: some View {
        ZStack{
            Color.white
                .frame(width: backgraoundSize, height: backgraoundSize)
                .cornerRadius(backgraoundSize)
                .shadow(radius: 10)
            Button(action: {
                
            }, label: {
                    Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize, alignment: .center)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
