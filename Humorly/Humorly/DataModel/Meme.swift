//
//  Meme.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import Foundation
import SwiftUI

// sturcture of meme data
struct Meme: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case tvandfilm = "TV and Film"
        case classic = "Classic"
        case corona = "Corona"
        case dutch = "Dutch"
        case cats = "Cats"
        case starwars = "Star Wars"
        case parents = "Parents"
        case history = "History"
        case news = "News"
        case theoffice = "The Office"
        case animals = "Animals"
        case struggles = "Struggles"
        case work = "Work"
        case school = "School"
        case sport = "Sport"
        case homework = "HomeWork"
        case science = "Science"
    }
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}




