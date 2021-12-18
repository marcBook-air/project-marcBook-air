//
//  NewAccountView.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI
import CloudKit

class NewAccountViewViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var date = Date()
    @Published var username: String = ""
    @Published var password: String = ""
    
    func MakeAccountButtonPressed() {
        guard !name.isEmpty else {return}
        print(name)
        guard !email.isEmpty else {return}
        guard !phone.isEmpty else {return}
        guard !username.isEmpty else {return}
        guard !password.isEmpty else {return}
        addAccount(Name: name, Email: email, Phone: phone, datE: date, Username: username, Password: password)
        
    }
    
    private func addAccount(Name: String, Email: String, Phone: String, datE: Date, Username: String, Password: String) {
        let newAccount = CKRecord(recordType: "Account")
        newAccount["name"] = Name
        newAccount["email"] = Email
        newAccount["phone"] = Phone
        newAccount["date"] = datE
        newAccount["username"] = Username
        newAccount["password"] = Password
        saveItems(record: newAccount)
    }
    
    private func saveItems(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) { returnedRecord, returnedError in
            print(returnedRecord ?? "1")
            print(returnedError ?? "2")
        }
    }
    
}

struct NewAccountView: View {
    
    @StateObject private var vm = NewAccountViewViewModel()
    @State private var image1: Image? = Image(systemName: "person")
    @State private var image2: Image? = Image(systemName: "person")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
        
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.opacity(0.2).edgesIgnoringSafeArea(.all)
                ScrollView {
                VStack {
                    Spacer()
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
                    SignUpButton
                }
                }
                .padding()
            .navigationTitle("New Account")
            }
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
                image1!
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .onTapGesture { self.shouldPresentActionScheet = true }
                    .sheet(isPresented: $shouldPresentImagePicker) {
                        SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image1, isPresented: self.$shouldPresentImagePicker)
                }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                    ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = true
                    }), ActionSheet.Button.default(Text("Photo Library"), action: {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = false
                    }), ActionSheet.Button.cancel()])
                }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.red, lineWidth: 2)
                    }.shadow(color: .red, radius: 4)
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
                image2!
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .onTapGesture { self.shouldPresentActionScheet = true }
                    .sheet(isPresented: $shouldPresentImagePicker) {
                        SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image2, isPresented: self.$shouldPresentImagePicker)
                }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                    ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your profile image"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = true
                    }), ActionSheet.Button.default(Text("Photo Library"), action: {
                        self.shouldPresentImagePicker = true
                        self.shouldPresentCamera = false
                    }), ActionSheet.Button.cancel()])
                }
                    .frame(width: 100, height: 100)
                    .clipShape(Rectangle())
                    .overlay {
                        Rectangle().stroke(.red, lineWidth: 2)
                    }.shadow(color: .red, radius: 4)
                Text("Change Favorite Meme")
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
    
    private var NameField: some View {
        TextField("Name", text: $vm.name)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(.default)
    }
    
    private var EmailField: some View {
        TextField("E-mail", text: $vm.email)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/)
    }
    
    private var PhoneField: some View {
        TextField("Phone Number", text: $vm.phone)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
            .keyboardType(.phonePad)
    }
    
    private var DatePickerField: some View {
        DatePicker(selection: $vm.date, in: ...Date(), displayedComponents: .date) {
            Text("Birthday")
        }
        .padding(.trailing)
        .frame(width: 312, height: 55)
        .padding(.leading)
        .background(Color.red.opacity(0.4))
        .cornerRadius(10)
    }

    private var UserNameField: some View {
        TextField("Username", text: $vm.username)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var PassWordField: some View {
        SecureField("Password", text: $vm.password)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var SignUpButton: some View {
        Button {
            vm.MakeAccountButtonPressed()
        } label: {
            Text("Make a new account")
                .foregroundColor(.black)
                .frame(width: 312, height: 55)
                .padding(.leading)
                .background(Color.red.opacity(0.8))
                .cornerRadius(10)
        }

    }
}




