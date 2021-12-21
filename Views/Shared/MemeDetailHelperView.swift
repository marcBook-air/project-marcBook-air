//
//  MemeDetailHelperView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

// used to make MemeDetailView
struct MemeDetailHelperView: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .cornerRadius(10)
            .padding()
            .scaledToFit()
            .shadow(color: .red, radius: 7)
    }
}

struct MemeDetailHelperView_Previews: PreviewProvider {
    static var previews: some View {
        MemeDetailHelperView(image: Image("meme1"))
    }
}
