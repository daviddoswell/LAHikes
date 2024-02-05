//
//  CustomButtonView.swift
//  LAHikes
//
//  Created by David Doswell on 2/3/24.
//

import SwiftUI

struct CustomButtonView: View {
  
  // MARK: - BODY

  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [
              .white,
              .customGreenLight,
              .customGreenMedium],
            startPoint: .top,
            endPoint: .bottom)
        )
      Circle()
        .stroke(
          LinearGradient(
            colors: [
              .colorGrayLight,
              .colorGrayMedium],
            startPoint: .top,
            endPoint: .bottom),
          lineWidth: 4)
      Image(systemName: "figure.hiking")
        .fontWeight(.black)
        .font(.system(size: 30))
        .foregroundStyle(
          LinearGradient(
            colors: [
              .colorGrayLight,
              .colorGrayMedium],
            startPoint: .top,
            endPoint: .bottom))
    }//: ZSTACK
    .frame(width: 58, height: 58)
  }
}

#Preview {
  CustomButtonView()
}
