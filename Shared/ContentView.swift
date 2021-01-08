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
    @State var current_task = ""
    @State var display_alert:Bool = false
    var body: some View {
        NavigationView{
            List{
        
                ForEach(reminder_list){ (reminders) in
                    Text(reminders.task)
                }.onDelete(perform:delete)
                TextField("Enter a reminder"
                          ,text: $current_task )
            }
            .alert(isPresented: $display_alert) {
                    Alert(
                        title: Text(
                            "You cannot have an empty reminder.")
                        )
            }
            .navigationTitle("Reminders")
            .navigationBarItems(leading: Button(action: {
                if current_task != ""{
                    reminder_list.append(reminders(task:current_task))
                    current_task = ""
                } else{
                    display_alert = true
                }
            }, label: {
                    Text("Add")
            })
            ,
            trailing: EditButton()
            )
        }
    }
    func delete(at offsets:IndexSet){
        reminder_list.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
