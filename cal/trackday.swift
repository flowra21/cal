import SwiftUI

struct DaysTrackerView: View {
    var language: String
    // Get the current date
    var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM"
        return formatter.string(from: Date())
    }

    // Get the current month
    var currentMonth: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: Date())
    }

    // Day names for the current week (for demo, assuming fixed)
    let dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    @State private var streak = 0
    @State private var frozenDays = 0
    @State private var currentDay = 4// Example: current day as 4th in the month
    @State private var daysLearned: [Int] = [1, 2, 3] // Days that have been marked as learned
    @State private var daysFrozen: [Int] = [] // Days that have been frozen
    let daysInMonth = Array(1...30)

  
    
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                // Display the current date at the top
                HStack {
                    Text(currentDate) // Shows today's date
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal)
                
                // Title
                HStack {
                    Text("Learning \(language)")                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Image("fire") // Streak icon
                        .resizable()
                        .frame(width: 60,height: 60)
                        .foregroundColor(.orange)
                }
                .padding()
                
                // Current month display
                HStack {
                    Text(currentMonth) // Displays the current month dynamically
                        .font(.headline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal)
                
                // Sequential day tracker with day names
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(0..<daysInMonth.count, id: \.self) { index in
                            VStack {
                                // Day name above the circle
                                Text(dayNames[index % 7]) // Display day name
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                // Day circle with the number
                                Text("\(daysInMonth[index])")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width: 60, height: 60)
                                    .background(
                                        Circle()
                                            .fill(
                                                daysLearned.contains(daysInMonth[index]) ? Color.orange :
                                                    (daysFrozen.contains(daysInMonth[index]) ? Color.blue : Color.gray)
                                            )
                                    )
                            }
                            .padding(.vertical)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Streak and freeze details
                HStack {
                    HStack {
                        Text("🔥")
                            .foregroundColor(.orange)
                        Text("\(streak) Day Streak")
                            .font(.subheadline)
                            .foregroundColor(.orange)
                    }
                    Spacer()
                    HStack {
                        Text("🧊")
                            .foregroundColor(.blue)
                        Text("\(frozenDays) Day Frozen")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                // Log today as learned button
                Button(action: {
                    if !daysLearned.contains(currentDay) && !daysFrozen.contains(currentDay) {
                        daysLearned.append(currentDay)
                        streak += 1
                    }
                }) {
                    Text("Log today as Learned")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 320, height: 320)
                        .background(Circle().fill(Color.orange))
//                        .frame(width: 320,height: 320)
                        .cornerRadius(40)
                }
                .padding()
                
                // Freeze day button
                Button(action: {
                    if !daysFrozen.contains(currentDay) && !daysLearned.contains(currentDay) {
                        daysFrozen.append(currentDay)
                        frozenDays += 1
                    }
                }) {
                    Text("Freeze day")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 162, height: 52)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                
                Text("\(frozenDays) out of 6 freezes used")
                    .foregroundColor(.gray)
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

struct DaysTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        DaysTrackerView(language: "")
    }
}
