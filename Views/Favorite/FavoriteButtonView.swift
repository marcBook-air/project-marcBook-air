//
//  FavoriteButtonView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

struct FavoriteButtonView: View {
    // binder variable that indicates if meme is marked as a favorite
    @Binding var isSet: Bool
    
    var body: some View {
        // Button that toggles the isSet variable
        Button {
            withAnimation {
                isSet.toggle()
            }
        } label: {
            // the physical manifestation of the toggle
            Label("Favorite", systemImage: "heart.fill")
                .labelStyle(.iconOnly)
                // color of button is red when true and gray when false
                .foregroundColor(isSet ? .red : .gray)
                .imageScale(.large)
                // rotation, scaling and shadow for effect when taped
                .rotationEffect(.degrees(360))
                .scaleEffect(isSet ? 1.5 : 1)
                .shadow(color: isSet ? Color(red: 0.118, green: 0.082, blue: 0.069) : .red , radius: 7)
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(isSet: .constant(true))
    }
}
