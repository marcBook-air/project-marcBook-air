//
//  DataModel.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    // loading data from json file
    @Published var memes : [Meme] = load("memeData.json")
    
    // memes that are marked as featured
    var features: [Meme] {
        memes.filter {$0.isFeatured}
    }
    
    // categories
    var catagories: [String: [Meme]] {
        Dictionary(grouping: memes , by: {$0.category.rawValue})
    }
}

// load function
// source: Apple Developer site
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
