import SwiftUI

struct LearningGoalView: View {
    var language: String
    @State private var learningSubject = "Swift"  // Default subject value
    @State private var selectedLearningTime = "Month"  // Default selected time

    var body: some View {
        NavigationView {
            VStack {
                // Top bar with "Back" and "Update"
                HStack {
                    Button(action: {
                        // Action for Back button
                    }) {
                        Text("Back")
                            .foregroundColor(.orange)
                    }

                    Spacer()

                    Text("Learning goal")
                        .font(.headline)
                        .foregroundColor(.white)

                    Spacer()

                    NavigationLink(destination: homeScreen(language: learningSubject)) {
                        Text("Update")
                            .foregroundColor(.orange)
                    }
                }
                .padding()

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
                                .foregroundColor(.gray).opacity(0.7),
                            alignment: .bottom
                        )
                }
                .padding(.horizontal)

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
                                .background(selectedLearningTime == "Week" ? Color.orange : Color.gray)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }

                        Button(action: {
                            selectedLearningTime = "Month"
                        }) {
                            Text("Month")
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(selectedLearningTime == "Month" ? Color.orange : Color.gray)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }

                        Button(action: {
                            selectedLearningTime = "Year"
                        }) {
                            Text("Year")
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(selectedLearningTime == "Year" ? Color.orange : Color.gray)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)

                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

struct LearningGoalView_Previews: PreviewProvider {
    static var previews: some View {
        LearningGoalView(language: "")
    }
}



