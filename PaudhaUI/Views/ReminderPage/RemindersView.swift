//
//  RemindersView.swift
//  REM
//
//  Created by SHHH!! private on 05/03/24.
//

import SwiftUI

struct RemindersView: View {
    @ObservedObject var reminderStore = ReminderStore()
    @State private var isAddReminderSheetPresented = false
    @State private var isEditing = false

    var body: some View {
        NavigationView {
            List {
                Section(header: ReminderSummaryView(reminderStore: reminderStore)) {
                    ForEach(reminderStore.reminders) { reminder in
                        ReminderRowView(reminderStore: reminderStore, reminder: reminder)
                    }
                    .onDelete { indexSet in
                        reminderStore.deleteReminder(at: indexSet)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .navigationBarTitle("Reminders")
            .navigationBarItems(
                leading: Button(action: {
                    isEditing.toggle() // Toggle the edit mode
                }) {
                    Text(isEditing ? "Done" : "Edit") // Change the button text based on the edit mode state
                },
                trailing: Button(action: {
                    isAddReminderSheetPresented = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isAddReminderSheetPresented) {
                AddReminderView(reminderStore: reminderStore)
                    .navigationBarItems(trailing: Button("Cancel") {
                        isAddReminderSheetPresented = false
                    })
            }
            .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive)) // Pass edit mode to the environment
        }
    }
}

struct RemindersView_Preview: PreviewProvider {
    static var previews: some View {
        RemindersView()
    }
}

