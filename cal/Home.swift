//
//  Home.swift
//  cal
//
//  Created by Adwa on 23/04/1446 AH.
//
import SwiftUI

struct Home: View {
    @State private var selectedLearningTime = "Month"
    @State private var learningSubject = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Top icon with resized image
                Image("A")
                    .resizable()  // Makes the image resizable
                    .frame(width: 200, height: 200)  // Set the desired size
                    .foregroundColor(.orange)
                
                Spacer()
                
                // Greeting text
                Text("Hello Learner!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading,-155)
                
                Text("This app will help you learn everyday")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)
                    .padding(.leading,-125)
                
                // Text input for subject
                VStack(alignment: .leading) {
                    Text("I want to learn")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    // Underlined TextField
                    TextField("Swift", text: $learningSubject)
                        .padding(.vertical, 10)
                        .foregroundColor(.gray)
                        .accentColor(.orange)
                        .overlay(
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.gray).opacity(0.2), alignment: .bottom
                        )
                    
                }
                .padding(.bottom, 30)
                
                // Time selection buttons
                VStack(alignment: .leading) {
                    Text("I want to learn it in a")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack {
                        Button(action: {
                            selectedLearningTime = "Week"
                        }) {
                            Text("Week")
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(selectedLearningTime == "Week" ? Color.orange : Color.gray) .opacity(0.5)
                                .foregroundColor(.orange)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedLearningTime = "Month"
                        }) {
                            Text("Month")
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(selectedLearningTime == "Month" ?Color.orange : Color.gray) .opacity(0.5)
                                .foregroundColor(.orange)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedLearningTime = "Year"
                        }) {
                            Text("Year")
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(selectedLearningTime == "Year" ? Color.orange : Color.gray)
                                .opacity(0.5)
                                .foregroundColor(.orange )
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.bottom, 40)
                
                // Start button
            
                    // Start learning action
                NavigationLink(destination:homeScreen(language: ""))
                {
                    Text("Start →")
                        .font(.headline)
                        .padding()
                        .frame(width: 180, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
            .padding()
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
    
    
}
