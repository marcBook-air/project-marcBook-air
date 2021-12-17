//
//  MatchMatchAccountView.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

struct MatchAccountView: View {
    
    var body: some View {
        
        ScrollView {
            VStack {
                ImageSliderView()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                Text("FirstName SecondNme")
                    .multilineTextAlignment(.leading)
                    .frame(width: 312, height: 55)
                    .padding(.leading)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .padding()
                
                Text("email@domein.com")
                    .multilineTextAlignment(.leading)
                    .frame(width: 312, height: 55)
                    .padding(.leading)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                
                Text("0612345678")
                    .multilineTextAlignment(.leading)
                    .frame(width: 312, height: 55)
                    .padding(.leading)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                    .padding()
                
                Text("12-12-2012")
                    .multilineTextAlignment(.leading)
                    .frame(width: 312, height: 55)
                    .padding(.leading)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
            }
        }
    }
}

struct MatchAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MatchAccountView()
    }
}


