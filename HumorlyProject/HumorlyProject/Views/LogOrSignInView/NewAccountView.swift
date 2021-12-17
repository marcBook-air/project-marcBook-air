//
//  NewAccountView.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

struct NewAccountView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var date = Date()
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ProfilePictureButton
                    MemePictureButton
                }
                NameField
                EmailField
                PhoneField
                DatePickerField
                UserNameField
                PassWordField
            }
            .padding()
            .navigationTitle("New Account")
        }
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}

extension NewAccountView {
    
    private var ProfilePictureButton: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: "person")
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.black, lineWidth: 0.7)
                    }
                Text("Change Profile Picture")
                    .padding()
            }
        }
    }
    
    private var MemePictureButton: some View {
        Button {
        } label: {
            VStack {
                Image(systemName: "person")
                    .frame(width: 100, height: 100)
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle().stroke(.black, lineWidth: 0.7)
                    }
                Text("Change Favorite Meme")
                    .padding()
            }
        }
    }
    
    private var NameField: some View {
        TextField("Name", text: $name)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(.default)
    }
    
    private var EmailField: some View {
        TextField("E-mail", text: $email)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/)
    }
    
    private var PhoneField: some View {
        TextField("Phone Number", text: $phone)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(.phonePad)
    }
    
    private var DatePickerField: some View {
        DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
            Text("Birthday")
        }
        .padding(.trailing)
        .frame(width: 312, height: 55)
        .padding(.leading)
        .background(Color.gray.opacity(0.4))
        .cornerRadius(10)
    }

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
}




