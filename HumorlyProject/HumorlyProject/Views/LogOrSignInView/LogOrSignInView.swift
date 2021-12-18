//
//  LogOrSignInView.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

struct LogOrSignInView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingProfile = false
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color.red.opacity(0.2).edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        UserNameField
                        PassWordField
                        SignInButton
                        Spacer()
                        Spacer()
                        Spacer()
                        NewAccountButton
                    }
                    .padding()
                .navigationTitle("Sign In")
                }
            }
    }
}

struct LogOrSignInView_Previews: PreviewProvider {
    static var previews: some View {
        LogOrSignInView()
    }
}

extension LogOrSignInView {
    
    private var UserNameField: some View {
        TextField("Username", text: $username)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var PassWordField: some View {
        SecureField("Password", text: $password)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var SignInButton: some View {
        
        Button {
            
        } label: {
            Text("Sign In")
                .foregroundColor(.black)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.8))
            .cornerRadius(10)
        }
    }
    
    private var NewAccountButton: some View {
        
        Button {
            showingProfile.toggle()
        } label: {
            Text("New Account")
                .foregroundColor(Color.black)
        }.sheet(isPresented: $showingProfile) {
            NewAccountView()
        }
        
    }
}
