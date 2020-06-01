//
//  MissionView.swift
//  Moonshot
//
//  Created by bingyuan xu on 2020-06-01.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct MissionView: View {
  let missions: Missions
  
  
  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        VStack {
          Image(self.missions.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geometry.size.width * 0.7)
            .padding(.top)
          Text(self.missions.description)
          .padding()
          Spacer(minLength: 25)
        }
      }
      
    }
    .navigationBarTitle(Text(missions.displayName), displayMode: .inline)
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Missions] = Bundle.main.decode("missions.json")
  static var previews: some View {
    MissionView(missions: missions[0])
  }
}
