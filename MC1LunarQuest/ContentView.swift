//
//  ContentView.swift
//  MC1LunarQuest
//
//  Created by Arantza Castro Dessavre on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userData : UserModel
    
    var body: some View {
        NavigationStack{
            UserSetupView().environmentObject(userData)
        }
    }
}

#Preview {
    ContentView().environmentObject(UserModel())
}
