//
//  Astronaut.swift
//  Moonshot
//
//  Created by bingyuan xu on 2020-05-31.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import Foundation

struct Astronaut: Codable, Identifiable {
  let id: String
  let name: String
  let description: String
}

struct Missions: Codable, Identifiable {
  
  struct Crew : Codable {
    let name: String
    let role: String
  }
  
  let id: Int
  let description: String
  let crew: [Crew]
  let launchDate : Date?
  var displayName: String {
    "Apollo \(id)"
  }
  
  var image: String {
    "apollo\(id)"
  }
  
  var formattedLaunchDate: String {
    if let launchDate = launchDate {
      let formatter = DateFormatter()
      formatter.dateStyle = .long
      return formatter.string(from: launchDate)
    } else {
      return "N/A"
    }
  }
}
