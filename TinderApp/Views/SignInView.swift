//
//  SignInView.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/08.
//

import SwiftUI

struct SignInView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    @State var isAlertActive = false
    @State var signUpSuccess = false
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                if self.signUpSuccess {
                    //登録成功時ホームビューを再構築
                    HomeView()
                }
                else {
                    //登録失敗時サインインビュー再構築
                    //SignInView()
                }
                
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .center, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 30){
                    
                    Text("Pinder")
                        .font(.system(size: 90, weight: .heavy))
                        .foregroundColor(Color.white)
                    
                    TextField("Name", text: self.$name)
                        .asSignInTextField()
                    
                    TextField("Email", text: self.$email)
                        .asSignInTextField()
                    
                    TextField("Password", text: self.$password)
                        .asSignInTextField()
                    
                    Button(action: {
                        if name == "" && email == "" && password == "" {
                            self.isAlertActive = true
                        }
                        else{
                            self.signUpSuccess.toggle()
                        }
                        
                    }, label: {
                        Text("Sigin Up")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(10)
                            .background(Color.red)
                        
                    })
                    .alert(isPresented: $isAlertActive, content:{
                        Alert(
                            title: Text("Error"),
                            message: Text("please input your information")
                        )
                    })
                    
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            Text("if you already hava account please tap here")
                            
                        })
                        .font(.system(size: 15))
                        .foregroundColor(Color.white)
                    
                }
                .padding(.horizontal, 50)
            }
        }
        .navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
