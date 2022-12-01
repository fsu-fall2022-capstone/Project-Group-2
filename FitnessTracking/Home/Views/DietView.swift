//
//  DietView.swift
//  FitnessTracking
//
//  Created by randy on 11/20/22.
//



import SwiftUI

struct Diet: View {
    let diets = DietData
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Image("istockphoto-877317520-612x612")
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
                        
                        ForEach(diets){ Diet_views in
                            // Day card
                            ZStack {
                                Image(Diet_views.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 380, height:220)
                                
                                VStack{
                                    Spacer()
                                    Text(Diet_views.day)
                                        .font(.largeTitle)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text("Calorie Count: " + Diet_views.calorieCount)
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
struct Diet_views: Identifiable{
    
    var id = UUID()
    
    var day: String
    var calorieCount: String
    var image: String
    
}
let DietData = [
    
        Diet_views(day: "Monday", calorieCount: "0", image: "istockphoto-505020568-612x612"),
        Diet_views(day: "Tuesday", calorieCount: "0", image: "istockphoto-505020568-612x612"),
        Diet_views(day: "Wednesday", calorieCount: "0", image: "istockphoto-505020568-612x612"),
        Diet_views(day: "Thursday", calorieCount: "0", image: "istockphoto-505020568-612x612"),
        Diet_views(day: "Friday", calorieCount: "0", image: "istockphoto-505020568-612x612"),
        Diet_views(day: "Saturday", calorieCount: "0", image: "istockphoto-505020568-612x612"),
        Diet_views(day: "Sunday", calorieCount: "0", image: "istockphoto-505020568-612x612"),
    
    
    ]

