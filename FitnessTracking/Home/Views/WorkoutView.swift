//
//  Workout.swift
//  FitnessTracking
//
//  Created by Matthew Kolnicki on 11/6/22.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationView {
            VStack {
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
                .padding(.top, 20)
                .clipped()
                
                
                Text("Daily Workouts")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        ForEach(0 ..< 5){ item in
                            // Day card
                            ZStack {
                                Image("leg-workout.jpg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 380, height:220)
                                
                                VStack{
                                    Spacer()
                                    Text("Monday")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text("Legs")
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
