//
//  CustomBackgroundView.swift
//  LAHikes
//
//  Created by David Doswell on 2/3/24.
//

import SwiftUI

struct CustomBackgroundView: View {
  
  // MARK: - BODY

  var body: some View {
    ZStack {
      // MARK: - 3. DEPTH
      
      Color.customGreenDark
        .clipShape(RoundedRectangle(cornerRadius: 40.0))
        .offset(y: 12.0)
      
      // MARK: - 2. LIGHT
      
      Color.customGreenLight
        .clipShape(RoundedRectangle(cornerRadius: 40.0))
        .offset(y: 3)
        .opacity(0.85)
      
      // MARK: - 1. SURFACE
      
      LinearGradient(
        colors: [
          Color.customGreenLight,
          Color.customGreenMedium
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .clipShape(RoundedRectangle(cornerRadius: 40.0))
    }
  }
}

#Preview {
  CustomBackgroundView()
    .padding()
}
