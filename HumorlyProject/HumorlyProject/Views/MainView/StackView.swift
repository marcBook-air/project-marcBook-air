//
//  StackView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

struct Meme: Hashable, CustomStringConvertible {
    var id: Int
    
    let imageName: String
    
    var description: String
}

struct StackView: View {
    @State var memes: [Meme] = [
        Meme(id: 1, imageName: "meme1", description: ""),
        Meme(id: 2, imageName: "meme2", description: ""),
        Meme(id: 3, imageName: "meme3", description: ""),
        Meme(id: 4, imageName: "meme4", description: ""),
        Meme(id: 5, imageName: "meme5", description: "")
        ]
    
    @State private var showingProfile = false
    
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(memes.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(memes.count - 1 - id) * 10
    }
    
    private var maxID: Int {
        return self.memes.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    ZStack {
                        ForEach(self.memes, id: \.self) { meme in
                            if meme.id > self.maxID - 4 {
                                CardView(meme: meme, onRemove: { removedMeme in
                                    self.memes.removeAll { $0.id == removedMeme.id }
                                })
                                    .padding(.trailing)
                                    .frame(width: self.getCardWidth(geometry, id: meme.id), height: 400)
                                    .offset(x: 0, y: self.getCardOffset(geometry, id: meme.id))
                            }
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Humorly")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
