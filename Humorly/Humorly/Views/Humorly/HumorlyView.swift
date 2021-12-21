//
//  HumorlyView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

struct HumorlyView: View {
    @EnvironmentObject var modelData: ModelData
    
    // when starting the app pick a random number to determine the meme that will be featured in the top of the view
    let number = Int.random(in: 0 ... 17)
    
    var body: some View {
        NavigationView {
            // list with featured meme and horizontal scrollviews of memes per category
            List {
                // link to detail-view of featured meme when taped
                NavigationLink {
                    MemeDetailView(meme: modelData.features[number])
                } label: {
                    modelData.features[number].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(10)
                        .shadow(color: .red, radius: 7)
                }
                
                // make a horizontal scrollview for all categories
                ForEach(modelData.catagories.keys.sorted(), id: \.self) { key in
                    CategoryRowView(categoryName: key, items: modelData.catagories[key]!)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Humorly")
            .shadow(color: .red, radius: 7)
        }
    }
}

struct HumorlyView_Previews: PreviewProvider {
    static var previews: some View {
        HumorlyView()
            .environmentObject(ModelData())
    }
}
