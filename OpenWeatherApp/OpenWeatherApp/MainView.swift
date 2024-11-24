//
//  MainView.swift
//  OpenWeatherApp
//
//  Created by Kacper Biaduń on 24/11/2024.
//

import SwiftUI

struct MainView: View {
  @State private var isListVisible: Bool = false
  @State private var isSettingsVisible: Bool = false
    var body: some View {
      NavigationStack {
        ZStack {
          VStack {
            WeatherView(weather: weather, viewModel: viewModel)
              .environmentObject(ColorSchemeManager)
              .toolbar {
                ToolbarItem {
                  Button(viewModel.formatTime(unixTime: Date(), timeZoneOffset: viewModel.weather.city.timezone)) {}
                    .foregroundStyle(Color.primary)
                    .bold()
                }
                ToolbarItem(placement: .topBarLeading) {
                  Button {
                    isListVisible.toggle()
                  } label: {
                    Image(systemName: "line.3.horizontal")
                      .foregroundColor(.primary)
                  }
                }
                ToolbarItem(placement: .topBarTrailing) {
                  Button {
                    isSettingsVisible.toggle()
                  } label: {
                    Image(systemName: "gearshape")
                      .foregroundColor(.primary)
                  }
                }
              }
              .onTapGesture {
                print("Spacer in LeftSideBarView tapped!")
                isSettingsVisible = false
                isListVisible  = false
              }
          }
          if isListVisible {
            HStack {
              LeftSideBarView(viewModel: viewModel)
                .environmentObject(colorSchemeManager)
                .frame(width: UIScreen.main.bounds.width * 0.75)
                .cornerRadius(20)
                .shadow(radius: 1)
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
                .transition(.move(edge: .leading))
                .onTapGesture {}
                                  
              Spacer()
            }
          }
          
          if isSettingsVisible {
            HStack {
              Spacer()
              RightSideBarView(viewModel: viewModel, isVisible: $isSettingsVisible)
                .environmentObject(colorSchemeManager)
                .frame(width: UIScreen.main.bounds.width * 0.75)
                .cornerRadius(20)
                .shadow(radius: 1)
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
                .transition(.move(edge: .trailing))
                .onTapGesture {}
            }
          }
        }
      }
    }
}

#Preview {
    MainView()
}
