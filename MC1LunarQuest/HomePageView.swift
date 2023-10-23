//
//  HomePageView.swift
//  LunarQuest
//
//  Created by Kevser on 22/10/23.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var userData : UserModel
    
    var body: some View {
        Text("Hello, \(userData.username)")
    }
}

#Preview {
    HomePageView().environmentObject(UserModel())
}
