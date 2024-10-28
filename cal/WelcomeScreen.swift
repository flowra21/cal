//
//  WelcomeScreen.swift
//  Learner
//
//  Created by Jwan Faisal Alameer on 17/04/1446 AH.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var learning = ""
    @State private var selectedOption: String = "Month"
    @State private var navigateToHome = false 

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                Image(.streak)
                    .resizable()
                    .frame(width : 200 , height: 200)
                    .padding(.top , -350)
                
                VStack{
                    Text("Hello Learner!")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading , -140)
                        .padding(.top , -110)
                }
                
                VStack{
                    Text("This app will help you learn everyday")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.leading , -110)
                        .padding(.top , -60)
                    
                }
                
                VStack{
                    Text("I want to learn ")
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.leading , -180)
                        .padding(.top , 70)
                    
                    TextField("Swift", text: $learning)
                        .foregroundColor(.gray)
                        .accentColor(.orange)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray).opacity(0.5),alignment: .bottom )
                        .padding(.horizontal, 20)
                }
                
                VStack{
                    Text("I want to learn it in a")
                        .foregroundColor(Color.white)
                        .bold()
                        .padding(.leading , -180)
                        .padding(.top , 180)
                    
                }
                
                HStack {
                    
                    
                    
                    Button(action: {
                        selectedOption = "Week"
                    }) {
                        Text("Week")
                            .fontWeight(selectedOption == "Week" ? .bold : .regular)
                            .frame(width: 50 , height: 10)
                            .foregroundColor(selectedOption == "Week" ? Color.black : Color.orange)
                            .padding()
                            .background(selectedOption == "Week" ? Color.orange : (Color.gray).opacity(0.4))
                        
                            .cornerRadius(10)
                    }
                    .padding(.top , 270)
                    .padding(.leading , -90)
                    
                    Button(action: {
                        selectedOption = "Month"
                    }) {
                        Text("Month")
                            .fontWeight(selectedOption == "Month" ? .bold : .regular)
                            .frame(width: 60 , height: 10)
                            .foregroundColor(selectedOption == "Month" ? Color.black : Color.orange)
                            .padding()
                            .background(selectedOption == "Month" ? Color.orange : (Color.gray).opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding(.top , 270)
                    
                    Button(action: {
                        selectedOption = "Year"
                    }
                    ) {
                        
                        Text("Year")
                            .fontWeight(selectedOption == "Year" ? .bold : .regular)
                            .frame(width: 50 , height: 10)
                            .foregroundColor(selectedOption == "Year" ? Color.black : Color.orange)
                        
                            .padding()
                            .background(selectedOption == "Year" ? Color.orange : (Color.gray).opacity(0.4))
                        
                            .cornerRadius(10)
                    }
                    .padding(.top , 270)
                    .padding(.leading , 6)
                }
                
                VStack{
                    Button(action: {
                        navigateToHome = true
                    }) {
                        HStack {
                            Text("Start")
                            Image(systemName: "arrow.right") // السهم من SF Symbols
                                .foregroundColor(.black) // لون السهم
                        }
                        .foregroundColor(.black)
                        .bold()
                        .frame(width: 150 , height: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                    }
                    .padding(.top , 450)
                    .background(NavigationLink(destination: homeScreen(language: learning), isActive: $navigateToHome) { EmptyView() } )
                }
            }
                
                
                
            }
          
                
        
    }
}
#Preview {
    WelcomeScreen()
}