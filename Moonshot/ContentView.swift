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
      List(missions) {mission in
        NavigationLink(destination: MissionView(missions: mission, astronauts: self.astronauts).buttonStyle(PlainButtonStyle())) {
          Image("\(mission.image)")
            .resizable()
            .frame(width: 44, height: 44)
            //            .aspectRatio(contentMode: .fit)
            .scaledToFit()  //和上边的注释一个意思
          
          VStack(alignment: .leading) {
            Text("\(mission.displayName)")
              .font(.headline)
            Text(mission.formattedLaunchDate)
          }
        }
      }
      .navigationBarTitle("Moonshot")
    }
  }
}


struct UpdateList_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
