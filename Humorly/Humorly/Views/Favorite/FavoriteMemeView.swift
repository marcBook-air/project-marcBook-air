//
//  FavoriteMemeView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

// script works exacetly the same as MemeCollectionView.swift but shows only the memes
// marked as favorite because showFavoritsOnly variable is marked as true
struct FavoriteMemeView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = true
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum:120)), count: 3)
    }
    var filterdMemes: [Meme] {
        modelData.memes.filter { meme in
            (!showFavoritesOnly || meme.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: items, spacing: 20) {
                    ForEach(filterdMemes, id: \.id) { meme in
                        NavigationLink {
                            MemeDetailView(meme: meme)
                        } label: {
                            MemeCollectionBlockView(meme: meme)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoriteMemeView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMemeView()
    }
}

