//
//  DietDataEntry.swift
//  FitnessTracking
//
//  Created by randy on 12/1/22.
//

import Foundation
import SwiftUI
import Firebase

struct DietDataEntry: View{
    var dietD: Diet_entry
    var body: some View{
        VStack {
            Text(dietD.day)
            List(dietD.foodList, id: \.self) {food in
                NavigationLink(destination: Text("Food Entries")){
                    ButtonView(title: food){
                        
                        
                    }
                }
                }
           }
            
        }
        
    }


struct DietDataEntry_preview: PreviewProvider {
    static var previews: some View {
        DietDataEntry(dietD: Diet_entry(day: "Monday", calorieCount: "0", image: "istockphoto-505020568-612x612", foodList: ["breakfast", "Lunch", "Dinner"]))
    }
}
