//
//  MatchMatchAccountView.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

struct MatchAccountView: View {
    
    var body: some View {
        
        ZStack {
            Color.red.opacity(0.2).edgesIgnoringSafeArea(.all)
            ScrollView {
                    VStack {
                        imageSlider
                        name
                        email
                        phone
                        date
                        
                }
            }
        }
    }
}

struct MatchAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MatchAccountView()
    }
}

extension MatchAccountView {
    
    private var imageSlider: some View {
        ImageSliderView()
            .ignoresSafeArea(edges: .top)
            .frame(height: 300)
    }
    
    private var name: some View {
        Text("FirstName SecondNme")
            .multilineTextAlignment(.leading)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
            .padding()
    }
    
    private var email: some View {
        Text("email@domein.com")
            .multilineTextAlignment(.leading)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var phone: some View {
        Text("0612345678")
            .multilineTextAlignment(.leading)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
            .padding()
    }
    
    private var date: some View {
        Text("12-12-2012")
            .multilineTextAlignment(.leading)
            .frame(width: 312, height: 55)
            .padding(.leading)
            .background(Color.red.opacity(0.4))
            .cornerRadius(10)
    }
    
}

