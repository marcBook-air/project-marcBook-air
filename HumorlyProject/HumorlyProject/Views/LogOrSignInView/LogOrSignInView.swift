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
    
    var body: some View {
            NavigationView {
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
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var PassWordField: some View {
        SecureField("Password", text: $password)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var SignInButton: some View {
        
        Button {
            
        } label: {
            Text("Sign In")
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
    
    private var NewAccountButton: some View {
        
        Button {
            
        } label: {
            Text("New Account")
        }
    }
}
