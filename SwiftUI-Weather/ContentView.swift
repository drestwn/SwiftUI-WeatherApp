//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Andre on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName:"Jakarta, IND")
                
                MainWeatherStatusView(ImageName: isNight ? "moon.zzz.fill" : "cloud.sun.fill", temp: "76")
                
                HStack(spacing: 20, content: {
                    WeatherDayView(dayOfWeek: "TUE", imageOfWeek: "cloud.sun.fill", tempOfWeek: 76)
                    WeatherDayView(dayOfWeek: "WED", imageOfWeek: "cloud.sun.fill", tempOfWeek: 80)
                    WeatherDayView(dayOfWeek: "THU", imageOfWeek: "cloud.sun.rain.fill", tempOfWeek: 30)
                    WeatherDayView(dayOfWeek: "FRI", imageOfWeek: "cloud.sun.bolt.fill", tempOfWeek: 36)
                    WeatherDayView(dayOfWeek: "SAT", imageOfWeek: "wind.snow", tempOfWeek: 40)
                    
                    
                })
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change the day time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageOfWeek: String
    var tempOfWeek: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageOfWeek)
                .symbolRenderingMode(.multicolor)
                .resizable()
//the symbolrenderingmode has different type to customize the icon color
//                .foregroundColor(.blue)
//                .foregroundStyle(.red, .green, .pink)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(tempOfWeek)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
   var isNight: Bool
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue , isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()

        //for simple gradient but not fully custom
//        ContainerRelativeShape()
//            .fill(isNight ? Color.gray.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    var ImageName : String
    var temp: String
    
    var body: some View{
        VStack (spacing: 8){
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
   
    
}

