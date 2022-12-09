//
//  Workout.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 11/6/22.
//
import SwiftUI

struct WorkoutView: View {
    
    let NormalWorkouts = workoutsNormalData
    let OverweightWorkouts = workoutsOverweightData
    let UnderweightWorkouts = workoutsUnderweightData
    let fullBody = fullBodyWorkout
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    var body: some View {
        let StringWeight = sessionService.userDetails?.weight ?? "N/A"
        let weight = Int(StringWeight) ?? 0
        let randomInt = Int.random(in: 1..<7)

    
        NavigationView {
            VStack (alignment: .leading) {
                
                ForEach(fullBody) { workout in
                    NavigationLink(destination: WorkoutDetailsView(workout: workout)){
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
                    }
                }
                
                
                Text("Daily Workouts")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        if weight < 100{
                            ForEach(NormalWorkouts){ workout in
                                // Day card
                                
                                NavigationLink(destination: WorkoutDetailsView(workout: workout)){
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
                        else{
                            ForEach(OverweightWorkouts){ workout in
                                // Day card
                                
                                NavigationLink(destination: WorkoutDetailsView(workout: workout)){
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
    var image: String
    var routine: [String]
}


let workoutsNormalData = [
    Workout(day: "Monday", image: "leg-workout.jpg", routine: ["Warmup", "Push-ups", "Cool Down"]),
    Workout(day: "Tuesday", image: "dumbbells.jpg", routine: ["Warmup", "Squats", "Cool Down"]),
    Workout(day: "Wednesday", image: "pullups.jpg", routine: ["Warmup", "Pull-ups", "Cool Down"]),
    Workout(day: "Thursday", image: "dumbbells.jpg", routine: ["Warmup", "Planks", "Cool Down"]),
    Workout(day: "Friday", image: "rope", routine: ["Warmup", "Curls", "Cool Down"]),
    Workout(day: "Saturday", image: "body", routine: ["Warmup", "Curls", "Cool Down"]),
    Workout(day: "Sunday", image: "fight", routine: ["Warmup", "Curls", "Cool Down"])
]
let workoutsOverweightData = [
    Workout(day: "Monday", image: "leg-workout.jpg", routine: ["Sprints: 100 meters, 12 reps", "100 pushups and situps", "Log 15k steps"]),
    Workout(day: "Tuesday", image: "dumbbells.jpg", routine: ["5 mile jog", "Asisted pullups: 30 Assisted chinups 30", "Log 15k steps"]),
    Workout(day: "Wednesday", image: "pullups.jpg", routine: ["Sprints 100 meters, 12 reps", "100 pushups and situps", "Log 15k steps"]),
    Workout(day: "Thursday", image: "dumbbells.jpg", routine: ["5 mile jog", "Asisted pullups:30 Assisted chinups:30", "Log 15k steps"]),
    Workout(day: "Friday", image: "rope", routine: ["Sprints: 100 meters, 12 reps", "100 pushups and situps", "Log 15k steps"]),
    Workout(day: "Saturday", image: "body", routine: ["5 mile jog", "Asisted pullups:30 Assisted chinups:30", "Log 15k steps"]),
    Workout(day: "Sunday", image: "fight", routine: ["Jump rope 1 hour, 3 minute inc, 2 min rest", "Curls: 10 sets, 6 reps, maxmum intensity", "Log 15k steps"])
]
let workoutsUnderweightData = [
    Workout(day: "Monday", image: "leg-workout.jpg", routine: ["Warmup", "Push-ups", "Cool Down"]),
    Workout(day: "Tuesday", image: "dumbbells.jpg", routine: ["Warmup", "Squats", "Cool Down"]),
    Workout(day: "Wednesday", image: "pullups.jpg", routine: ["Warmup", "Pull-ups", "Cool Down"]),
    Workout(day: "Thursday", image: "dumbbells.jpg", routine: ["Warmup", "Planks", "Cool Down"]),
    Workout(day: "Friday", image: "rope", routine: ["Warmup", "Curls", "Cool Down"]),
    Workout(day: "Saturday", image: "body", routine: ["Warmup", "Curls", "Cool Down"]),
    Workout(day: "Sunday", image: "fight", routine: ["Warmup", "Curls", "Cool Down"])
]
let fullBodyWorkout = [
    Workout(day: "Full Body", image: "arm-workout.jpg", routine: ["Warmup", "Push-ups", "Cool Down"])
]
