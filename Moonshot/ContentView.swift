//
//  ContentView.swift
//  Moonshot
//
//  Created by bingyuan xu on 2020-05-29.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var show = true
  var body: some View {
    NavigationView {
      
      VStack {
        ScrollView(.vertical) {
          VStack(spacing: 10) {
            ForEach(0 ..< 100) {
              Text("Item \($0)")
                .font(.title)
            }
          }
          .frame(maxWidth : .infinity)
        }
        Text(self.show ? "true" : "false")
        GeometryReader {geo in
          Image("example")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: geo.size.width)          //          .clipped()
        }
        
      }
        
      .navigationBarItems(trailing:
        Button(action: {
          self.show.toggle()
          print("something")
        }) {
          Image(systemName: "trash")
      })
    }
    .edgesIgnoringSafeArea(.leading)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
