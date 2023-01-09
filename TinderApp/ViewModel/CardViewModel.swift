//
//  CardViewModel.swift
//  TinderApp
//
//  Created by Furkat Ethan on 2023/01/06.
//

import SwiftUI

class CardViewModel: ObservableObject{
    
    @Published var translation: CGSize = .zero
    @Published var numbers = [0, 1, 2, 3, 4, 5]
    @Published var goodOpacity: Double = 0
    @Published var nopeOpacity: Double = 0
    
    //userInformation
    @Published var userInfo = [UserInformation]()
    init(){
        userInfo.append(UserInformation(name: "Ethan", area: "Fukuoka", comment: "Reading books!!!!", image: "Erdrich"))
        userInfo.append(UserInformation(name: "Zoe", area: "Fukuoka", comment: "Drinking everyday!!", image: "Gundam"))
        userInfo.append(UserInformation(name: "Satoshi", area: "Tokyo", comment: "Sex Sex Sex!! That's my life", image: "Judai"))
        userInfo.append(UserInformation(name: "Somekawa", area: "Kagoshima", comment: "TyoooooMooooooo", image: "Alan"))
        userInfo.append(UserInformation(name: "Nakabepu", area: "Kumamoto", comment: "come one sexy lady", image: "Sakura"))
        userInfo.append(UserInformation(name: "Hirakawa", area: "Fukuoka", comment: "Sxxk My Dxxk", image: "Pooman"))
    }
}
