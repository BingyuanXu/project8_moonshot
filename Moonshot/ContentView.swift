//
//  ContentView.swift
//  Moonshot
//
//  Created by bingyuan xu on 2020-05-29.
//  Copyright © 2020 bingyuan xu. All rights reserved.
//

import SwiftUI

struct CustomText : View {
  var text : String
  var body: some View {
    Text(text)
  }
  init(_ text : String) {
    print("new text")
    self.text = text
  }
}

struct ContentView: View {
  @State private var show = true
  
  var body: some View {
    
    NavigationView {
      
      VStack {
        
        NavigationLink(destination: Text("Detail View")) {
          Text("Hello World")
        }
        
        List(0 ..< 100)  { row in
          NavigationLink(destination: Text("Detail \(row)")){
            Text("Row \(row)")
          }
        }
        
        
        
        ScrollView(.vertical) {
          VStack(spacing: 10) {
            ForEach(0 ..< 100) {
              CustomText("Item \($0)")
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
            .frame(width: geo.size.width)
            .clipped()
        }
      }
      .navigationBarTitle("SwiftUI")
        
      .navigationBarItems(trailing: Button(action: {print("a")}){
        Image(systemName: "trash")
        }
      )
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
