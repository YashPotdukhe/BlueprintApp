//
//  PrankTexter.swift
//  BlueprintApp
//
//  Created by Chris Zhang on 2/21/21.
//

import SwiftUI
import UserNotifications

struct PrankTexter: View {
    
    @State private var sendername:String = ""
    @State private var message:String = ""
    @State private var time:String = ""
    
    @State private var date = Date()
    
    var body: some View {
        VStack {
            
            VStack {
                Spacer()
                Image(systemName: "message").foregroundColor(.white).frame(width: 30, height:30).background(Color.blue.opacity(23.0)).cornerRadius(6).scaleEffect(4).padding([.top, .leading, .trailing]).shadow(radius: 7)
                
                Text("Prank Texter").bold().frame(width: 350.0, height: 50).scaleEffect(3).padding(.vertical, 50)
                Spacer()
            }
            
            VStack {
                Button("Allow Notifications") {
                    
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
                        success, error in if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }.padding(.bottom, 50)
                
                HStack {
                    Text("Name of Sender")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10)
                    Spacer()
                }
                TextField("ex. Lebron James", text: $sendername).padding(.leading)
                HStack {
                    Text("Contents of Message")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 10)
                    Spacer()
                }
                TextField("ex. It's TACO TUESDAYYYYY", text: $message).padding(.leading)
                
                DatePicker(selection: $date, label: { Text("Time of Notification") }).padding(.leading, 10)
                Spacer()
                
                Button(action: {
                        let notifDate = date.timeIntervalSince(Date())
                        
                        let content = UNMutableNotificationContent()
                        content.title = sendername
                        content.subtitle = message
                        content.sound = UNNotificationSound.default
                        
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notifDate, repeats: false)
                        
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request)
                }, label: {
                    Text("Schedule Notfication").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 30).background(Color.blue).cornerRadius(20).shadow(radius: 3)
                })
                Spacer()
            }
            
        }
    }
}

struct PrankTexter_Previews: PreviewProvider {
    static var previews: some View {
        PrankTexter()
    }
}
