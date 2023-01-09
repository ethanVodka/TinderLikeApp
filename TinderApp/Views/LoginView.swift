//
//  LoginView.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/08.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .center, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 30){
                    Text("Login")
                        .font(.system(size: 90, weight: .heavy))
                        .foregroundColor(Color.white)
                    
                    TextField("Email", text: self.$email)
                        .asSignInTextField()
                    
                    TextField("Password", text: self.$password)
                        .asSignInTextField()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Sigin In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(10)
                            .background(Color.red)
                        
                    })
                    
                    //ボタン操作により遷移情報を捨てて以前の画面に戻る
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("if you don't hava account please tap here")
                            .foregroundColor(Color.white)
                    })
            
                    // navigationLinkによる画面遷移
                    //
                    //
                    //NavigationLink(destination: SignInView(), label: {Text("if you don't hava account please tap here")})
                    //    .font(.system(size: 15))
                    //    .foregroundColor(Color.white)
                    
                }
                .padding(.horizontal, 50)
            }
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
