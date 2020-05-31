//
//  ContentView.swift
//  Moonshot
//
//  Created by bingyuan xu on 2020-05-29.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  var missions: [Missions] = Bundle.main.decode("missions.json")
  
  var body: some View {
    NavigationView {
      VStack {
         Text("\(astronauts.count)")
         Text("\(missions.count)")
       }
    }
  }
}


struct UpdateList_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
