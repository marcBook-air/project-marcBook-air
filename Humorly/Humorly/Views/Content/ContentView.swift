//
//  ContentView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 19/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .humorly
    
    enum Tab {
        case humorly
        case collection
        case favorites
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HumorlyView()
                .tabItem {
                    Label("Humorly", systemImage: "sparkle.magnifyingglass")
                }
                .tag(Tab.humorly)
            
            MemeCollectionView()
                .tabItem {
                    Label("Collection", systemImage: "square.grid.3x2")
                }
                .tag(Tab.collection)
            
            FavoriteMemeView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(Tab.favorites)
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
