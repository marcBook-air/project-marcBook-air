//
//  CategoryMemeView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

struct CategoryMemeView: View {
    var meme: Meme
    
    var body: some View {
        VStack(alignment: .leading) {
            // image
            meme.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .shadow(color: .red, radius: 7)
            
            // text
            Text(meme.name)
                .font(.caption)
                .foregroundColor(.black)
                .shadow(color: .red, radius: 7)
        }
        .padding(15)
    }
}

struct CategoryMemeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMemeView(meme: ModelData().memes[0])
    }
}
