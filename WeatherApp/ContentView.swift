//
//  ContentView.swift
//  WeatherApp
//
//  Created by Berkin KOCA on 6.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Seattle, WA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 19)
                
                HStack(spacing: 20) {
                    DailyWeatherView(day: "Tue",
                                     weatherImage: "cloud.sun.fill",
                                     degree: 16)
                    
                    DailyWeatherView(day: "Wed",
                                     weatherImage: "sun.max.fill",
                                     degree: 20)
                    
                    DailyWeatherView(day: "THU",
                                     weatherImage: "wind",
                                     degree: 12)
                    
                    DailyWeatherView(day: "FRI",
                                     weatherImage: "sunset.fill",
                                     degree: 15)
                    
                    DailyWeatherView(day: "SAT",
                                     weatherImage: "cloud.sun.fill",
                                     degree: 22)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                })
                
                Spacer()
                
            }
        }
    }
}



//MARK: Extracted Views

struct DailyWeatherView: View {
    
    var day: String
    var weatherImage: String
    var degree: Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 52, height: 52)
            
            Text("\(degree)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .serif))
            .foregroundStyle(.white)
            .padding(.vertical, 20)
            .padding(.horizontal, 12)
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 72, weight: .medium))
                .foregroundStyle(.white )
        }
    }
}

#Preview {
    ContentView()
}


