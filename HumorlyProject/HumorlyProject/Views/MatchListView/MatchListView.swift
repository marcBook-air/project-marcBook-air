//
//  MatchListView.swift
//  HumorlyPrototype
//
//  Created by Marc Vlasblom on 09/12/2021.
//

import SwiftUI

struct MatchListView: View {
    @State private var showingProfile = false
    
    var body: some View {
        ZStack {
            Color.red.opacity(0.2).edgesIgnoringSafeArea(.all)
            Button {
                showingProfile.toggle()
            }label: {
                VStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    Text("Inge de Bruin")
                        .foregroundColor(.black)
                        .font(.subheadline)
                    }
                }
            .sheet(isPresented: $showingProfile) {
                MatchAccountView()
            }
        }
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView()
    }
}
