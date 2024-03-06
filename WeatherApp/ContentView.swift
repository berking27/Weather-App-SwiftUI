//
//  ContentView.swift
//  WeatherApp
//
//  Created by Berkin KOCA on 6.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .lightBlue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Seattle, WA")
                    .font(.system(size: 32, weight: .medium, design: .serif))
                    .foregroundStyle(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 12)

                VStack(spacing: 12) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        
                    Text("30°")
                        .font(.system(size: 72, weight: .medium))
                        .foregroundStyle(.white )
                }
                
                HStack(spacing: 20) {
                    dailyWeatherPreview(day: "Tue",
                                        weatherImage: "cloud.sun.fill",
                                        degree: 16)
                    
                    dailyWeatherPreview(day: "Wed",
                                        weatherImage: "sun.max.fill",
                                        degree: 20)
                    
                    dailyWeatherPreview(day: "THU",
                                        weatherImage: "wind",
                                        degree: 12)
                    
                    dailyWeatherPreview(day: "FRI",
                                        weatherImage: "sunset.fill",
                                        degree: 15)
                    
                    dailyWeatherPreview(day: "SAT",
                                        weatherImage: "cloud.sun.fill",
                                        degree: 22)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                
                Spacer()

            }
        }
    }
}

@ViewBuilder func dailyWeatherPreview(day: String, weatherImage: String, degree: Int) -> some View {
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

#Preview {
    ContentView()
}
