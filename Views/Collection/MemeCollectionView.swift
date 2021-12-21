//
//  MemeCollectionView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

struct MemeCollectionView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
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
            // enable vertical scrolling
            ScrollView(.vertical, showsIndicators: false) {
                // makes a grid with 3 colomus and an undefined numeber of rows
                LazyVGrid(columns: items, spacing: 20) {
                    // for al memes in assets
                    ForEach(filterdMemes, id: \.id) { meme in
                        // if you tap on the meme you go to the detail-view of that meme
                        NavigationLink {
                            MemeDetailView(meme: meme)
                        } label: {
                            MemeCollectionBlockView(meme: meme)
                        }
                    }
                }
            }
            .navigationTitle("Collection")
        }
    }
}

struct MemeCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MemeCollectionView()
    }
}

