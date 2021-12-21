//
//  MemeCollectionBlockView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

struct MemeCollectionBlockView: View {
    var meme: Meme
    
    var body: some View {
        ZStack {
            HStack {
                // image
                meme.image
                    .resizable()
                    .frame(width: 106, height: 106)
                    .scaledToFill()
                    .cornerRadius(10)
                    .shadow(color: .red, radius: 7)
            }
            
            HStack {
                Spacer()
                
                VStack {
                    // if meme is favorite show a heart on the meme
                    if meme.isFavorite {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .opacity(0.9)
                            .frame(width: 40, height: 40)
                            .shadow(color: .red, radius: 7)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

// make a preview to inspect the look of the view
struct MemeCollectionBlockView_Previews: PreviewProvider {
    static var memes = ModelData().memes
    
    static var previews: some View {
        Group {
            MemeCollectionBlockView(meme: memes[0])
                .previewLayout(.fixed(width: 120, height: 120))
            
            MemeCollectionBlockView(meme: memes[2])
                .previewLayout(.fixed(width: 120, height: 120))
        }
    }
}
