//
//  ContentView.swift
//  LAHikes
//
//  Created by David Doswell on 2/3/24.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: - PROPERTIES
  
  @Environment(\.colorScheme) var colorScheme
  
  // MARK: - BODY

  var body: some View {
    ZStack {
      Color.customGreenLight
        .ignoresSafeArea()
      
      // MARK: - CARD VIEW

      CardView()
        .foregroundStyle(colorScheme == .dark ? .white : .black)
    }
  }
}

#Preview {
  ContentView()
}
