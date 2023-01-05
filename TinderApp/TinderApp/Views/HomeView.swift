//
//  ContentView.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/05.
//

import SwiftUI

struct HomeView: View {
    private var framewidth: CGFloat{
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        VStack {
            //トップコントロールビュー
            TopControlView()
            
            //画像表示領域
            CardView()
            
            //ボトムコントロールビュー
            BottomControlView()
        }
    }
}

struct CardView: View{
    @State var translation_: CGSize = .zero
    @State var numbers = [0, 1, 2, 3, 4, 5]
    
    var body: some View{
        GeometryReader(content: { geometory in
            
            ForEach(numbers, id: \.self) { number in
                ZStack{
                    ZStack{
                        Image("boost")
                            .resizable()
                            .scaledToFill()
                            .background(Color.white)
                        
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),
                                       startPoint: .top, endPoint: .bottom)
                    }
                    .frame(width: geometory.size.width - 20, height: geometory.size.height)
                    .cornerRadius(10)
                    .padding(.all, 10)
                    .shadow(radius: 5)
                    
                    VStack{
                        HStack{
                            Text("good")
                                .font(.system(size: 45, weight: .heavy))
                                .foregroundColor(Color.green)
                                .padding(.all, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.green, lineWidth: 4)
                                )
                            Spacer()
                            Text("nope")
                                .font(.system(size: 45, weight: .heavy))
                                .foregroundColor(Color.red)
                                .padding(.all, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.red, lineWidth: 4)
                                )
                        }
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .frame(width: geometory.size.width - 20)
                        
                        Spacer()
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("TARO")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 45, weight: .heavy))
                                Text("福岡")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20, weight: .medium))
                                Text("カラオケよく行きます。")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20, weight: .medium))
                            }
                            .padding(.leading, 20)
                            
                            Spacer()
                            
                            Button(action:{
                                
                            }, label:{
                                Image(systemName: "info.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .frame(width: 40, height: 40)
                            })
                            .padding(.trailing, 20)
                        }
                        .padding(.bottom, 30)
                        .frame(width: geometory.size.width - 20)
                    }
                }
                .offset(self.numbers.last == number ? translation_ : .zero)
                .rotationEffect(self.numbers.last == number ? .degrees(Double(self.translation_.width / 300 * 20)) : .zero)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.translation_ = value.translation
                        })
                        .onEnded({ value in
                            
                            if value.startLocation.x - 150 > value.location.x{
                                //左スワイプ
                                self.translation_ = .init(width: -800, height: 0)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                    self.numbers.removeLast()
                                    self.translation_ = .zero
                                }
                            }
                            else if value.startLocation.x + 150 < value.location.x{
                                //右スワイプ
                                self.translation_ = .init(width: 800, height: 0)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                    self.numbers.removeLast()
                                    self.translation_ = .zero
                                }
                            }
                            else{
                                //元に位置に戻る
                                self.translation_ = .zero
                            }
                        })
                )
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1.0), value: Double(self.translation_.width / 300 * 20))
            }
        })
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
