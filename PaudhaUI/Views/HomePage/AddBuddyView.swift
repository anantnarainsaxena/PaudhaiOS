//
//  AddBuddyView.swift
//  Ui2
//
//  Created by user1 on 15/03/24.
//

import SwiftUI

import SwiftUI
import UIKit

struct AddBuddyView: View {
    @EnvironmentObject var plantCollection: PlantCollection
    @State private var buddyNickname = ""
    @State private var buddyType = ""
    @State private var buddyDesc = ""
    @State private var selectedImage: UIImage?
    @State private var tempSelectedImage: UIImage?
    @State private var showImagePicker = false
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                TextField("Buddy Nickname", text: $buddyNickname)
                    .padding()

                TextField("Buddy Type", text: $buddyType)
                    .padding()
                
                TextField("Buddy's Story", text: $buddyDesc)
                    .padding()
                
                Button(action: {
                    showImagePicker = true
                }) {
                    Text("Select Image")
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker1(selectedImage: $tempSelectedImage, isImagePickerPresented: $showImagePicker)
                }

                if let selectedImage = tempSelectedImage ?? selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                },
                trailing: Button(action: {
                    // Save buddy action
                    if let selectedImage = tempSelectedImage {
                        let imageName = UUID().uuidString
                        saveImageToDocumentDirectory(image: selectedImage, imageName: imageName)
                        plantCollection.plants.append(Plant(imageName: imageName, nickname: buddyNickname, type: buddyType, description: buddyDesc))
                        buddyNickname = ""
                        buddyType = ""
                        buddyDesc = ""
                        tempSelectedImage = nil
                        showImagePicker = false
                        
                        presentationMode.wrappedValue.dismiss()

                        // Print statements
                        print("Image saved to document directory")
                        print("New Plant added to collection: \(plantCollection.plants.last)")
                    }
                }) {
                    Text("Save")
                }
            )
        }
    }

    // Function to save image to the document directory
    func saveImageToDocumentDirectory(image: UIImage, imageName: String) {
        if let data = image.jpegData(compressionQuality: 1.0) {
            let filename = getDocumentsDirectory().appendingPathComponent(imageName)
            try? data.write(to: filename)
        }
    }
    
    // Function to get the documents directory path
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
