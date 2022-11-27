//
//  DietView.swift
//  FitnessTracking
//
//  Created by randy on 11/20/22.
//



import SwiftUI

struct Diet: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Image("istockphoto-877317520-612x612.jpeg")
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
                
                
                Text("Meals by Day")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        ForEach(0 ..< 5){ item in
                            // Day card
                            ZStack {
                                Image("istockphoto-505020568-612x612.jpeg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 380, height:220)
                                
                                VStack{
                                    Spacer()
                                    Text("Monday")
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text("Calorie Count:")
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
            .navigationBarTitle("Meal Plans")
        }
    }
}

struct Diet_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
