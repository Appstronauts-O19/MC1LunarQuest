//
//  Settings.swift
//  MC1LunarQuest
//
//  Created by Fabio Festa on 24/10/23.
//

import SwiftUI

struct Settings: View {
    
    @EnvironmentObject var userData : UserModel
    
    
    var body: some View {
        
        
        NavigationStack {
            
            Image(userData.role.stringValue)
                .resizable()
                .frame(width: 157, height: 300)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.top,-80)
            
                
                
            Text("Astronaut Name")
                .font(
                    Font.custom("SF Pro", size: 30)
                        .weight(.bold)
                )
                .foregroundColor(.white)
                .padding(.top)
                .padding(.leading,-150)
            
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 360, height: 44)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                        .overlay(
                            TextField("Username: ", text: $userData.username)
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                .foregroundColor(.white)
                        )
                )
            
           
            Text("Pick your role")
              .font(
                Font.custom("SF Pro", size: 22)
                  .weight(.bold)
              )
              .foregroundColor(.white)
              .padding(.top)
              .padding(.leading,-183)
            
            HStack(spacing: 100) {
                Button("Explorer") {
                    userData.role  = .explorer
                }
                .buttonStyle(PurpleButtonStyle(toggled: userData.role == .explorer))
                
                Button("Scientist") {
                    userData.role  = .scientist
                }
                .buttonStyle(PurpleButtonStyle(toggled : userData.role == .scientist))
            }.padding()
            
         
            
            Text("Allow Permissions")
              .font(
                Font.custom("SF Pro", size: 22)
                  .weight(.bold)
              )
              .foregroundColor(.white)
              .padding(.top)
              .padding(.leading,-180)
            
            
            Rectangle()
                .foregroundColor(.gray.opacity(0.3))
                .frame(width: 360, height: 44)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                        .overlay( Label("Allow Camera Access", systemImage: "camera.fill")
                                  )
                    
                    
                    
                    
            )
        


            

            
            
                .navigationTitle("Settings")
        }
        
    }
}

#Preview {
    Settings().environmentObject(UserModel())
}

