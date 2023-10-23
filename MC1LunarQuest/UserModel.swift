//
//  UserModel.swift
//  LunarQuest
//
//  Created by Kevser on 20/10/23.
//


import Foundation
import SwiftUI

enum Role{
    case scientist
    case explorer
}

class UserModel: ObservableObject{
    let id : UUID = UUID()
    @Published var username : String = "John Doe"
    @Published  var role : Role = .explorer
    @Published var badges: [Badge] = []
}


struct Badge: Identifiable {
    var id: String
    var image: Image
}




