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
        ZStack{
            VStack {
                //トップコントロールビュー
                TopControlView()
                
                //画像表示領域
                CardView()
                
                //ボトムコントロールビュー
                BottomControlView()
            }
        }
        .background(Color.white)
    }
}

struct CardView: View{
    
    @EnvironmentObject var vm: CardViewModel
    
    var body: some View{
        GeometryReader(content: { geometory in
            
            ForEach(vm.numbers, id: \.self) { number in
                CardDetailView(number: number, geometory: geometory)
                    .offset(vm.numbers.last == number ? vm.translation : .zero)
                .rotationEffect(vm.numbers.last == number ? .degrees(Double(vm.translation.width / 300 * 20)) : .zero)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            DragOnChanged(value: value)
                        })
                        .onEnded({ value in
                            DragOnEnded(value: value)
                        })
                )
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 1.0), value: Double(vm.translation.width / 300 * 20))
            }
        })
    }
    
    //カードスワイプ中
    private func DragOnChanged(value: DragGesture.Value){
        vm.translation = value.translation
        
        let diffValue: CGFloat = value.startLocation.x - value.location.x
        let ratio: CGFloat = 1 / 150
        let opacity: CGFloat = ratio * diffValue
        
        if value.startLocation.x > value.location.x{
            vm.goodOpacity = .zero
            vm.nopeOpacity = (Double)(opacity)
        }
        else if value.startLocation.x < value.location.x{
            vm.goodOpacity = (Double)(-opacity)
            vm.nopeOpacity = .zero
        }
    }
    
    //カードスワイプ終了
    private func DragOnEnded(value: DragGesture.Value){
        if value.startLocation.x - 150 > value.location.x{
            //左スワイプ
            //画面中央より150Pixel左までスワイプリリース時に処理
            vm.translation = .init(width: -800, height: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                vm.numbers.removeLast()
                vm.translation = .zero
            }
        }
        else if value.startLocation.x + 150 < value.location.x{
            //右スワイプ
            //画面中央より150Pixel右までスワイプリリース時に処理
            vm.translation = .init(width: 800, height: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                vm.numbers.removeLast()
                vm.translation = .zero
            }
        }
        else{
            //元に位置に戻る
            vm.translation = .zero
        }
        vm.goodOpacity = .zero
        vm.nopeOpacity = .zero
    }
}


struct CardDetailView: View{
    
    var number: Int
    var geometory: GeometryProxy
    @EnvironmentObject var vm: CardViewModel
    
    var imageName = ["Pooman", "Gundam", "Judai", "boost", "Erdrich", "Sakura"]
    var userName: String = "Ethan"
    var userArea: String = "Fukuoka"
    //趣味の表示は考慮中
    //var userLikes: String = "Karaoke"
    var userComment: String = "I like to singing in karaoke"
    
    var body: some View{
            ZStack{
                Image(imageName[number])
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
                        .opacity(vm.numbers.last == number ? vm.goodOpacity : .zero)
                    
                    Spacer()
                    
                    Text("nope")
                        .font(.system(size: 45, weight: .heavy))
                        .foregroundColor(Color.red)
                        .padding(.all, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.red, lineWidth: 4)
                        )
                        .opacity(vm.numbers.last == number ? vm.nopeOpacity : .zero)
                }
                .padding(.top, 20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .frame(width: geometory.size.width - 20)
                
                Spacer()
                
                HStack{
                    VStack(alignment: .leading){
                        Text(userName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 45, weight: .heavy))
                        Text(userArea)
                            .foregroundColor(Color.white)
                            .font(.system(size: 20, weight: .medium))
                        Text(userComment)
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
}


//preview template
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
