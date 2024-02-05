//
//  SettingsView.swift
//  LAHikes
//
//  Created by David Doswell on 2/3/24.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
  private let alternateAppIcons: [String] = [
  "AppIcon-MagnifyingGlass",
  "AppIcon-Map",
  "AppIcon-Camera",
  "AppIcon-Backpack",
  "AppIcon-Campfire",
  "AppIcon-Mushroom",
  ]
  
  // MARK: - BODY
  
  var body: some View {
    List {
      // MARK: - SECTION: HEADER
      
      Section {
        HStack {
          Spacer()
          
          Image(systemName: "laurel.leading")
            .font(.system(size: 80, weight: .black))
          
          VStack(spacing: -10) {
            Text("L.A. Hikes")
              .font(.system(size: 30, weight: .black))
            
            Text("Editor's Choice")
              .fontWeight(.medium)
              .padding()
          }
          
          Image(systemName: "laurel.trailing")
            .font(.system(size: 80, weight: .black))
          
          Spacer()
        }
        .foregroundStyle(
          LinearGradient(
            colors: [
              .colorGreenMedium,
              .colorGreenDark
            ],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .padding(.top, 8)
        
        VStack(spacing: 8) {
          Text("Where can you find \n perfect tracks?")
            .font(.title2)
            .fontWeight(.heavy)
          
          Text("From Bronson Caves to Mount Baldy, search for the best places in Los Angeles to hike.")
            .font(.footnote)
            .italic()
          
          Text("Dust off your boots. It's time for a walk.")
            .fontWeight(.heavy)
            .foregroundStyle(.colorGreenMedium)
        }
        .multilineTextAlignment(.center)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
      } //: HEADER
      .listRowSeparator(.hidden)
      
      // MARK: - SECTION: ICONS
      
      Section(header: Text("Alternate Icons")) {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
            ForEach(alternateAppIcons.indices, id: \.self) { item in
              Button {
                print("Icon \(alternateAppIcons[item]) was pressed")
                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                  if error != nil {
                    print("Failed request to update the app's icon: \(String(describing: error?.localizedDescription))")
                  } else {
                    print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                  }
                }
              } label: {
                Image("\(alternateAppIcons[item])-Preview")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 80)
                  .clipShape(RoundedRectangle(cornerRadius: 16))
              }
            .buttonStyle(.borderless)
            }
          }
        } //: SCROLL VIEW
        .padding(.top, 12)
        
        Text("Choose your favorite app icon from the collection above.")
          .frame(minWidth: 0, maxWidth: .infinity)
          .multilineTextAlignment(.center)
          .foregroundStyle(.secondary)
          .font(.footnote)
          .padding(.bottom, 12)
      } //: SECTION
      
      // MARK: - SECTION: ABOUT
      
      Section(
        header: Text("Featured Hikes"),
        footer: HStack {
          Spacer()
          Text("Copyright © 2024 L.A. Hikes. All rights reserved.")
          Spacer()
        }
          .padding(.vertical, 8)
      ) {
        
        CustomListRowView(rowLabel: "Bridge to Nowhere", rowIcon: "mountain.2.circle",  rowTintColor: .brown, rowLinkLabel: "9.9 miles", rowLinkDestination: "https://www.cntraveler.com/activities/los-angeles/bridge-to-nowhere")
        
        CustomListRowView(rowLabel: "Bronson Caves", rowIcon: "mountain.2.circle", rowTintColor: .pink, rowLinkLabel: "6.5 miles", rowLinkDestination: "https://www.cntraveler.com/activities/san-francisco/bronson-canyon")
        
        CustomListRowView(rowLabel: "Escondido Falls", rowIcon: "mountain.2.circle", rowTintColor: .purple, rowLinkLabel: "3.5 miles", rowLinkDestination: "https://www.alltrails.com/trail/us/california/escondido-falls-trail")
        
        CustomListRowView(rowLabel: "Grasslands Trail", rowIcon: "mountain.2.circle", rowTintColor: .mint, rowLinkLabel: "6.1 miles", rowLinkDestination: "https://www.alltrails.com/trail/us/california/grasslands-trailhead")
        
        CustomListRowView(rowLabel: "Mount Hollywood", rowIcon: "mountain.2.circle",  rowTintColor: .indigo, rowLinkLabel: "2.5 miles", rowLinkDestination: "https://www.alltrails.com/trail/us/california/mount-hollywood-trail")
        
        CustomListRowView(rowLabel: "Mount Baldy", rowIcon: "mountain.2.circle", rowTintColor: .blue, rowLinkLabel: "6.5 miles", rowLinkDestination: "https://www.cntraveler.com/activities/los-angeles/mount-baldy")
        
        CustomListRowView(rowLabel: "Switzer Falls", rowIcon: "mountain.2.circle", rowTintColor: .red, rowLinkLabel: "4.5 miles", rowLinkDestination: "https://www.cntraveler.com/activities/tujunga/switzer-falls")
      }
    } //: SECTION
  } //: LIST
}

#Preview {
    SettingsView()
}
