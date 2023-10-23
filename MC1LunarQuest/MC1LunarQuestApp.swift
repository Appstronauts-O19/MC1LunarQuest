//
//  MC1LunarQuestApp.swift
//  MC1LunarQuest
//
//  Created by Arantza Castro Dessavre on 23/10/23.
//

import SwiftUI

@main
struct MC1LunarQuestApp: App {
    
    @StateObject var userData = UserModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userData)
        }
    }
}
