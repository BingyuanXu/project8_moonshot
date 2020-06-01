//
//  MissionView.swift
//  Moonshot
//
//  Created by bingyuan xu on 2020-06-01.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct MissionView: View {
  
  struct CrewMember {
    let role: String
    let astronaut: Astronaut
  }
  
  let missions: Missions
  let astronauts: [CrewMember]
  
  
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
          ForEach(self.astronauts, id: \.role) { crewMember in
            HStack {
              Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 83, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [.black, .yellow]), startPoint: .top, endPoint: .bottom)
                  , lineWidth: 0.5))
                .shadow(radius: 8)
              
              VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                  .font(.headline)
                Text(crewMember.role)
                  .foregroundColor(.secondary)
              }
              
              Spacer()
            }
            .padding(.horizontal)
          }
          Spacer(minLength: 25)
        }
      }
      
    }
    .navigationBarTitle(Text(missions.displayName), displayMode: .inline)
  }
  
  init(missions: Missions, astronauts: [Astronaut]) {
    self.missions = missions
    var match = [CrewMember]()
    
    for crew in missions.crew {
      if let person = astronauts.first(where: {$0.id == crew.name}) {
        match.append(CrewMember(role: crew.role, astronaut: person))
      } else {
        fatalError("Missing \(crew)")
      }
    }
    self.astronauts = match
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Missions] = Bundle.main.decode("missions.json")
  
  static let astronaut: [Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    MissionView(missions: missions[0], astronauts: astronaut)
  }
}
