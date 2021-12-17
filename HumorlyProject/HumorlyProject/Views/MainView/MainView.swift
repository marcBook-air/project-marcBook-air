//
//  MainView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selection: Tab = .swipen
    
    enum Tab {
        case swipen
        case matches
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                StackView()
                    .tabItem {
                        Label("Swipen", systemImage: "hand.draw")
                    }
                    .tag(Tab.swipen)
                MatchListView()
                    .tabItem {
                        Label("Matches", systemImage: "list.bullet")
                    }
                    .tag(Tab.matches)
            }
        }
    }
}
            

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
        }
    }
}
