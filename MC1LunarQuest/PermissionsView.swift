//
//  PermissionsView.swift
//  LunarQuest
//
//  Created by Kevser on 21/10/23.
//

import SwiftUI
import AVFoundation


func checkCameraAuthorization() async -> Bool {
    let status = AVCaptureDevice.authorizationStatus(for: .video)
    
    // Determine if the user previously authorized camera access.
    var isAuthorized = status == .authorized
    
    // If the system hasn't determined the user's authorization status,
    // explicitly prompt them for approval.
    if status == .notDetermined {
        isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
    }
    
    return isAuthorized
}


struct PermissionsView: View {
    
    @EnvironmentObject var userData : UserModel
    
    @State private var cameraPermissionToggled = false
    @State private var isAlertPresented = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("permissions")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                VStack {
                    Spacer(minLength: 500)
                    Text("Camera Access")
                        .font(.title).bold()
                        .foregroundColor(.white)
                    
                    Text("To unlock the full Augmented Reality adventure, grant us permission to access your camera. It's an essential component for an immersive and captivating experience.")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color.gray.opacity(0.6))
                            .frame(height: 50)
                            .padding(.horizontal)
                        
                        HStack {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(4.0)
                                    .foregroundColor(.blue)
                                    .frame(width: 40, height: 30)
                                
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                    .padding()
                            }.padding()
                            
                            Toggle("Allow Camera", isOn: $cameraPermissionToggled)
                                .foregroundColor(.white)
                                .font(.system(size: 18).weight(.semibold))
                                .padding()
                                .onChange(of: cameraPermissionToggled, { oldValue, newValue in
                                    if newValue {
                                        isAlertPresented = true
                                        Task.init (operation: {
                                            let isAuthorized = await checkCameraAuthorization()
                                            if isAuthorized {
                                                isAlertPresented = false
                                            } else {
                                                cameraPermissionToggled.toggle()
                                            }
                                        })
                                    }
                                })
                        }
                                
                    }.padding()
                    
                    HStack {

                        NavigationLink(destination: HomePageView().environmentObject(userData)) {
                            Label("Explore the Universe  ", systemImage: "arrowshape.forward.circle")
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.gray.opacity(0.6)))
                                .foregroundColor(.white)
                        }
                    }.padding()
                    
                    Spacer()
                    
                }
                .blur(radius: isAlertPresented ? 3 : 0)
                
                
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
    PermissionsView().environmentObject(UserModel())
}
