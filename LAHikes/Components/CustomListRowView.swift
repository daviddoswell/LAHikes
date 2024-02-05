//
//  CustomListRowView.swift
//  LAHikes
//
//  Created by David Doswell on 2/3/24.
//

import SwiftUI

struct CustomListRowView: View {
  
  // MARK: - PROPERTIES
  
  @State var rowLabel: String
  @State var rowIcon: String
  @State var rowContent: String? = nil
  @State var rowTintColor: Color
  @State var rowLinkLabel: String? = nil
  @State var rowLinkDestination: String? = nil
  
  // MARK: - BODY

  var body: some View {
    LabeledContent {
      // Content
      if rowContent != nil {
        Text(rowContent!)
          .foregroundStyle(.primary)
          .fontWeight(.heavy)
      } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
        Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
          .foregroundStyle(rowTintColor)
          .fontWeight(.heavy)
      } else {
        EmptyView()
      }
    } label: {
      HStack {
        ZStack {
          RoundedRectangle(cornerRadius: 8)
            .frame(width: 30, height: 30)
            .foregroundStyle(rowTintColor)
          Image(systemName: rowIcon)
            .fontWeight(.semibold)
        }
        Text(rowLabel)
      }
    }
  }
}

#Preview {
  List {
    CustomListRowView(
      rowLabel: "Website",
      rowIcon: "globe",
      rowContent: nil,
      rowTintColor: .pink,
      rowLinkLabel: "David Doswell",
      rowLinkDestination: "https://www.daviddoswell.com"
    )
  }
}
