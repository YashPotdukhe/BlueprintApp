//
//  SpamAlarms.swift
//  BlueprintApp
//
//  Created by Chris Zhang on 2/21/21.
//

import SwiftUI
import Combine
import AVFoundation
import AVKit
import AudioToolbox

struct SpamAlarms: View {
    
    @State var audioPlayer: AVAudioPlayer!
    @State private var numRepeats: String = ""
    @State private var date = Date()
    @State private var timeInbetween:String = ""
    @State private var toggleState:Bool = true
    
    var body: some View {
        
        VStack {
            VStack {
                Spacer()
                Image(systemName: "alarm").foregroundColor(.white).frame(width: 30, height:30).background(Color.blue.opacity(23.0)).cornerRadius(6).scaleEffect(4).padding([.top, .leading, .trailing]).shadow(radius: 7)
                
                Text("Spam Alarm").bold().frame(width: 350.0, height: 50).scaleEffect(3).padding(.vertical, 50)
                Spacer()
            }
            // pick date for spam alarm
            DatePicker(selection: $date, label: { Text("Date") }).padding(.leading, 10.0)
            
            HStack {
                Text("Number of Alarms")
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 10)
                Spacer()
            }
            TextField("3", text: $numRepeats).keyboardType(.numberPad)
                .onReceive( Just (numRepeats)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.numRepeats = filtered
                    }
                }.padding(.leading)
            HStack {
                Text("Time Interval Between Alarms")
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 10)
                Spacer()
            }
            TextField("60 seconds", text: $timeInbetween).keyboardType(.numberPad)
                .onReceive( Just (timeInbetween)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.timeInbetween = filtered
                    }
                }.padding(.leading)
            
            
            Toggle(isOn: $toggleState) {
                Text("Toggle Spam Alarm")
            }.padding(.leading)
            
            ZStack {
                VStack {
                    Text("Play").font(.system(size: 45)).font(.largeTitle)
                    HStack {
                        Spacer()
                        Button(action: {
                            //we wanted to schedule the sound to play at a certain time but couldn't figure out how
                            self.audioPlayer!.play()
                            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                        }) {
                            Image(systemName: "play.circle.fill").resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                        }
                        Spacer()
                        Button(action: {
                            self.audioPlayer.pause()
                        }) {
                            Image(systemName: "pause.circle.fill").resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                        }
                        Spacer()
                    }
                }
            }
            .onAppear {
                    
                    let sound = Bundle.main.path(forResource: "mkto", ofType: "mp3")
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))

            }
            
        }
        
    }
}

struct SpamAlarms_Previews: PreviewProvider {
    static var previews: some View {
        SpamAlarms()
    }
}

