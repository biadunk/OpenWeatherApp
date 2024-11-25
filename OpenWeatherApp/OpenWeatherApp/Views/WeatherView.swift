//
//  WeatherView.swift
//  OpenWeatherApp
//
//  Created by Kacper Biaduń on 24/11/2024.
//

import SwiftUI

struct WeatherView: View {
  var weather: ResponseData
  @StateObject var viewModel: WeatherViewModel
  @EnvironmentObject var colorSchemeManager: ColorSchemeManager
  
    var body: some View {
      ZStack {
        Color.gray.opacity(0.1)
          .ignoresSafeArea(.all)
        
        ScrollView(showsIndicators: false) {
          VStack {
            TopWeatherView(viewModel: viewModel)
            
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(viewModel.weather.list, id: \.self) { hourly in
                  HourlyForecastView(weatherList: hourly, weather: viewModel.weather, viewModel: viewModel)
                }
              }
            }
          }
        }
      }
    }
}

#Preview {
    WeatherView()
}
