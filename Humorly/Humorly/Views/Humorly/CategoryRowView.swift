//
//  CategoryRowView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

struct CategoryRowView: View {
    var categoryName: String
    var items: [Meme]
    
    var body: some View {
        VStack(alignment: .leading) {
            // text
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
                .shadow(color: .red, radius: 7)
            
            // enable horizontal scrolling in row
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    // for all memes in a category
                    ForEach(items) { meme in
                        // if you tap on the meme you go to the detail-view of that meme
                        NavigationLink {
                            MemeDetailView(meme: meme)
                        } label: {
                            CategoryMemeView(meme: meme)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

// make a preview to inspect this view
struct CategoryRowView_Previews: PreviewProvider {
    
    static var memes = ModelData().memes
    
    static var previews: some View {
        CategoryRowView(categoryName: memes[0].category.rawValue, items: Array(memes.prefix(4)))
    }
}
