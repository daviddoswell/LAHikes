//
//  CustomCircleView.swift
//  LAHikes
//
//  Created by David Doswell on 2/3/24.
//

import SwiftUI

struct CustomCircleView: View {
  
  // MARK: - PROPERTIES

  @State private var isAnimateGradient: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [
              .colorIndigoMedium,
              .colorSalmonLight
            ],
            startPoint:
              isAnimateGradient ?
              .topLeading : .bottomLeading,
            endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
        )
        .onAppear {
          withAnimation(
            .linear(duration: 3.0)
            .repeatForever(autoreverses: true)) {
              isAnimateGradient.toggle()
            }
        }
      MotionAnimationView()
    } //: ZSTACK
    .frame(width: 256.0, height: 256.0)
  }
}

#Preview {
  CustomCircleView()
}
