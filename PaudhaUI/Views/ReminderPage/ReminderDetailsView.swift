//
//  ReminderDetailsView.swift
//  REM
//
//  Created by SHHH!! private on 05/03/24.
//

import SwiftUI

struct ReminderDetailsView: View {
    var reminder: Reminder

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Image Section
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.gray.opacity(0.2))
                    reminder.image.map {
                        Image(uiImage: $0)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .clipped()
                    }
                }
                .padding(.horizontal)
                
                // Reminder Details
                ZStack{
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Location:")
                            .font(.headline)
                        Text("\(reminder.location)")
                            .foregroundColor(.secondary)
                        
                        Text("Action:")
                            .font(.headline)
                        Text("\(reminder.action)")
                            .foregroundColor(.secondary)
                        
                        Text("Repeat Options:")
                            .font(.headline)
                        ForEach(reminder.repeatOptions, id: \.self) { date in
                            Text("\(date)")
                                .foregroundColor(.secondary)
                        }
                        
                        Text("Time:")
                            .font(.headline)
                        Text("\(reminder.time)")
                            .foregroundColor(.secondary)
                        
                        Text("Last Watering:")
                            .font(.headline)
                        Text("\(reminder.lastWatering)")
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .padding()
            .navigationBarTitle(reminder.name)
        }
    }
}
