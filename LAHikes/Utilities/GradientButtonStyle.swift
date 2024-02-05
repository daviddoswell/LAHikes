//
//  GradientButtonStyle.swift
//  LAHikes
//
//  Created by David Doswell on 2/3/24.
//

import SwiftUI

struct GradientButton: ButtonStyle {
  
  // MARK: - FUNCTIONS

  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .padding(.vertical)
      .padding(.horizontal, 30)
      .background(
        // Conditional Statement with Swift Ternary Operator
        // Condition ? A : B
        configuration.isPressed ?
        // A: When user pressed the button
        LinearGradient(colors: [.colorGrayMedium, .colorGrayLight], startPoint: .top, endPoint: .bottom)
        :
          // B: When the button is not pressed
        LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom)
      )
      .clipShape(RoundedRectangle(cornerRadius: 40))
  }
}

