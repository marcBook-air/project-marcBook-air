//
//  ImageSliderViewView.swift
//  HumorlyProject
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

struct ImageSliderView: View {

    private let images = [ "person", "person.fill"]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { item in
                 Image(systemName: item)
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
