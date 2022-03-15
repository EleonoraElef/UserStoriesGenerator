//
//  ContentView.swift
//  UserStoryGenerator#2
//
//  Created by Eleonora Elefante on 12/03/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
static let userStoriesArray: [String] =  ["As a tired Apple Developer Academy’s learner, I want to identify Academy chairs using machine learning so that I can find the most comfortable one.", "As a lone smoker, I want to know which balcony in the Academy is less busy so that I can have my cigarette without engaging in social interactions.", "As a world-class developer, I want to project my app on the Academy’s wall using AR so that I can impress my reviewers. ", "As a masochist learner, I want to find Francesco Dell’Aglio during lunchtime with core location so that I can ask for feedback on my app.", "As a fitness enthusiast, I want to track the amount of calories I lose when going from Lab1 to Seminar so that I can have a good reason to walk around.", "As a chronically late person, I want to play a game in which I kick away the queue of learners that are taking the elevator at 9.05/14.05 so that I can let my anger out.", "As a hungry learner, I want to scan mentors holding pizza and report them to Barbara so that they will be hungry as well.", "As a desperate developer, I want to find coding mentors in the Academy so that I can ask what a SIGABRT error is.", "As a responsible human being, I want to detect learners not wearing a mask around the Academy so that I can try and instil some sense of responsibility into them.", "As a power-hungry learner, I want to track the location of my Mac charger so that I can finally stop losing it.", "As lazy learner, I want to find a working badging machine in the Academy so that I can easily badge in.", "As a curious learner, I want to identify the voice of the mentors so I can deduce who is in the boardrooms."]
    
    class PlayViewModel {
        private var audioPlayer: AVAudioPlayer!
        func play() {
            let sound = Bundle.main.path(forResource: "GongSoundEffect", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.play()
        }
    }
    
   let audioPlayer = PlayViewModel()
   @State var randomUserStory = userStoriesArray.randomElement()!
   @State var generateButtonIsDisplayed = true
   @State var refreshButtonIsTapped = false
   
    
   var body: some View {
        
        ZStack {
            
            Image("Background").resizable()
            
        VStack {
            
//--FIRST VIEW: TITLE +  "GENERATE USER STORY" BUTTON
            if generateButtonIsDisplayed {
                
                VStack(spacing:300) {
                    VStack {
                        
                        Text("DESIGN TOURNAMENT").font(.system(size: 55, weight: .bold)).multilineTextAlignment(.center)
                
                        Text("user story generator").font(.system(size: 28.9, weight: .regular)).multilineTextAlignment(.center)
                      }
                
                      Button(action: {
                          
                          self.audioPlayer.play()
                          
                       withAnimation(.linear(duration: 0.3)){
                        self.generateButtonIsDisplayed = false
                        
                        }
                    }){
                    
                     GenerateButtonView()
                    
                  }.buttonStyle(.plain)
                }.padding(.bottom, 370)
              }
            
//--SECOND VIEW: USER STORY GENERATION + STAR + REFRESH BUTTON
            if !generateButtonIsDisplayed || refreshButtonIsTapped {
                
                ZStack {
                    
                    Image("StarBG")
                    
                 VStack {
                    Text(randomUserStory)
                        .font(.system(size: 28.9, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center).frame(width: 500, height: 250, alignment: .center)
                        
                     VStack(alignment: .center) {
                     Button(action: {

                       randomUserStory = Self.userStoriesArray.randomElement()!
                         
                       self.audioPlayer.play()
                          
                       withAnimation(.linear(duration: 0.3)) {
                       self.refreshButtonIsTapped = true
                           
                        }
                          
                  }) {
                       Image("RefreshButton")

                        }.buttonStyle(.plain)
                         
                        Text("Generate again").font(.system(size: 22.1, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
                         
                      }
                    }.padding(.top,100)
                }.transition(.move(edge: .bottom))
              }
           }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
