//
//  Workout.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 11/6/22.
//
// testing a commit cause this is so gahdayum buggy
import SwiftUI

struct WorkoutView: View {
    
    let workouts = workoutsData
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                ZStack{
                    Image("arm-workout.jpg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height:300)
                    //vertical stack
                    
                    VStack{
                        Spacer()
                        Text("Full Body")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Placeholder text")
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .frame(width: 380)
                    //.background(Color(UIColor.systemGray))
                }
                .frame(width:380, height:300)
                .cornerRadius(20)
                .shadow(radius: 8)
                //.padding(.top, 20)
                .padding()
                .clipped()
                
                
                Text("Daily Workouts")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        ForEach(workouts){ workout in
                            // Day card
                            
                            NavigationLink(destination: Text(workout.day)){
                                ZStack {
                                    Image(workout.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 380, height:220)
                                    
                                    VStack{
                                        Spacer()
                                        Text(workout.day)
                                            .font(.largeTitle)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        Text(workout.bodyPart)
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(width: 380)
                                }
                                .frame(width: 150, height: 220)
                                .clipped()
                                .cornerRadius(20)
                                .shadow(radius: 10)
                            }
                        }
                    }
                }
                .padding()
                .offset(x: 0, y: -35)
                Spacer()
            }
            .navigationBarTitle("Workouts")
        }
    }
}

struct Workout_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}




struct Workout: Identifiable{
    var id = UUID()
    
    var day: String
    var bodyPart: String
    var image: String
    var routine: [String]
}

let workoutsData = [
    Workout(day: "Monday", bodyPart: "Chest", image: "leg-workout.jpg", routine: ["Warmup", "Push-ups", "Cool Down"]),
    Workout(day: "Tuesday", bodyPart: "Legs", image: "dumbbells.jpg", routine: ["Warmup", "Squats", "Cool Down"]),
    Workout(day: "Wednesday", bodyPart: "Back", image: "pullups.jpg", routine: ["Warmup", "Pull-ups", "Cool Down"]),
    Workout(day: "Thursday", bodyPart: "Abs", image: "dumbbells.jpg", routine: ["Warmup", "Planks", "Cool Down"]),
    Workout(day: "Friday", bodyPart: "Arms", image: "pullups.jpg", routine: ["Warmup", "Curls", "Cool Down"])
]
