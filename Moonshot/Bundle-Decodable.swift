//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by bingyuan xu on 2020-05-31.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T { //If you try compiling this code, you’ll see an error in Xcode: “Instance method 'decode(_:from:)' requires that 'T' conform to 'Decodable’”. What it means is that T could be anything: it could be an array of astronauts, or it could be an array of something else entirely. The problem is that Swift can’t be sure the type we’re working with conforms to the Codable protocol, so rather than take a risk it’s refusing to build our code.
        guard let url = self.url(forResource: file, withExtension: nil) else {      //self 就是 bundle
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

    return loaded
    }
}
