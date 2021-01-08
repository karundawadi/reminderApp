//
//  ContentView.swift
//  Shared
//
//  Created by Karun Dawadi on 1/7/21.
//

import SwiftUI

// This should be identifiable because we are
// Trying to make the functions identifiable
struct reminders: Identifiable{
    let id = UUID();
    let task:String;
}

struct ContentView: View {
    // @State means this variable has an state
    @State var reminder_list = [
        reminders(task: "Water the plant"),
        reminders(task: "Take Tommy out")
    ]
    var body: some View {
        NavigationView{
            List{
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
