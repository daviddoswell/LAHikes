//
//  CardView.swift
//  LAHikes
//
//  Created by David Doswell on 2/3/24.
//

import SwiftUI

struct CardView: View {
  
  // MARK: - PROPERTIES
  
  @State private var imageNumber: Int = 1
  @State private var randomNumber: Int = 1
  @State private var isShowingSheet: Bool = false
  
  // MARK: - FUNCTIONS
  
  func randomImage() {
    print("---BUTTON WAS PRESSED---")
    print("Status: Old Image Number = \(imageNumber)")
    repeat {
      randomNumber = Int.random(in: 1...5)
      print("Action: Random Number Generated = \(randomNumber)")
    } while randomNumber == imageNumber
    
    imageNumber = randomNumber
    print("Result: New Image Number = \(imageNumber)")
    print("---THE END---")
    print("\n")
  }
  
  // MARK: - BODY
  
  var body: some View {
    
    // MARK: - CARD
    
    ZStack {
      CustomBackgroundView()
      
      VStack {
        
        // MARK: - HEADER
        
        VStack(alignment: .leading) {
          HStack {
            Text("L.A. Hikes")
              .fontWeight(.black)
              .font(.system(size: 52))
              .foregroundStyle(
                LinearGradient(
                  colors: [
                    .colorGrayLight,
                    .colorGrayMedium
                  ],
                  startPoint: .top,
                  endPoint: .bottom)
              )
            Spacer()
            
            Button {
              // ACTION: Show a Sheet
              print("The button was pressed")
              isShowingSheet.toggle()
            } label: {
              CustomButtonView()
            }
            .sheet(isPresented: $isShowingSheet) {
              SettingsView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
            }
          }
          Text("Beautiful Los Angeles adventures for friends and families.")
            .multilineTextAlignment(.leading)
            .italic()
            .foregroundStyle(.colorGrayMedium)
        } //: HEADER
        .padding(.horizontal, 30)
        
        // MARK: - MAIN CONTENT
        
        ZStack {
          CustomCircleView()
          
          Image("image-\(imageNumber)")
            .resizable()
            .scaledToFit()
            .animation(.default, value: imageNumber)
        }
        
        // MARK: - FOOTER
        
        Button {
          // ACTION: Generate a random number
          randomImage()
        } label: {
          Text("Things to Do")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundStyle(
              LinearGradient(
                colors: [
                  .colorGreenLight,
                  .colorGreenMedium],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
        
      } //: ZSTACK
    } //: CARD
    .frame(width: 320.0, height: 570.0)
  }
}

#Preview {
  CardView()
}
