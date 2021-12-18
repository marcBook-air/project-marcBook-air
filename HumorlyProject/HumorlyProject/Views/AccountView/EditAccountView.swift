//
//  EditAccountView.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 17/12/2021.
//

import SwiftUI

struct EditAccountView: View {
    
    @State private var name: String = "Marc Vlasblom"
    @State private var email: String = "marc.vlasblom@gmail.com"
    @State private var phone: String = "0612345678"
    @State private var date: String = "12-12-1997"
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.opacity(0.2).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        ProfilePictureButton
                        MemePictureButton
                    }
                    NameField
                    EmailField
                    PhoneField
                    DatePickerField
                    SaveChanges
                }
                .padding()
            .navigationTitle("Account")
            }
        }
    }
}

struct EditAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EditAccountView()
    }
}

extension EditAccountView {
    
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
                    .foregroundColor(.black)
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
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    private var NameField: some View {
        TextField("Name", text: $name)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(.default)
    }
    
    private var EmailField: some View {
        TextField("E-mail", text: $email)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/)
    }
    
    private var PhoneField: some View {
        TextField("Phone Number", text: $phone)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(.phonePad)
    }
    
    private var DatePickerField: some View {
        TextField("Birthday", text: $date)
            .padding(.trailing)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var SaveChanges: some View {
        Button {
        } label: {
            Text("Save Changes")
                .foregroundColor(.black)
                .frame(width: 312, height: 55)
                .padding(.leading)
                .background(Color.red.opacity(0.8))
                .cornerRadius(10)
        }
    }

}
