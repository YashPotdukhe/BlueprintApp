//
//  ContentView.swift
//  BlueprintApp
//
//  Created by Chris Zhang on 2/21/21.
//

import SwiftUI

struct ContentView: View {
    
    static let gradientStart = Color(red: 239.0/255, green: 120.0/255, blue: 221/255)
    static let gradientEnd = Color(red: 239.0/255, green: 172.0/255, blue: 120.0/255)
    
    var body: some View {
        
        // matched geometry
        ZStack {
            
            Rectangle().fill(LinearGradient(gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]), startPoint: .init(x: 0.5, y: 0), endPoint: .init(x: 0.5, y: 0.6))).ignoresSafeArea(.all)
            
            NavigationView {
                VStack {
                    Spacer()
                    NavigationLink(
                        destination: PrankTexter()) {
                        
                        Image(systemName: "message").foregroundColor(.white).frame(width: 30, height:30).background(Color.blue.opacity(23.0)).cornerRadius(6).scaleEffect(4).padding([.top, .leading, .trailing]).shadow(radius: 7)
                    }
                    .navigationBarTitle("Prank Tool")
                    NavigationLink(
                        destination: PrankTexter()) {
                        
                        Text("Prank Texter").fontWeight(.bold).foregroundColor(Color.black).cornerRadius(3).frame(width: 300, height: 50).scaleEffect(1).padding(.vertical, 35.0)
                    }
                    .navigationBarTitle("Prank Tool")
                    Spacer()
                    NavigationLink(
                        destination: SpamAlarms()) {
                        
                        Image(systemName: "alarm").foregroundColor(.white).frame(width: 30, height: 30).background(Color.blue).cornerRadius(6).scaleEffect(4).padding([.top, .leading, .trailing]).shadow(radius: 7)
                    }
                    .navigationBarTitle("Alarm Tool")
                    NavigationLink(
                        destination: SpamAlarms()) {
                        
                        Text("Spam Alarm").fontWeight(.bold).foregroundColor(Color.black).cornerRadius(3).frame(width: 100, height: 50).scaleEffect(1).padding(.vertical, 35)
                    }
                    .navigationBarTitle("Alarm Tool")
                    Spacer()
                }
                
                
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
