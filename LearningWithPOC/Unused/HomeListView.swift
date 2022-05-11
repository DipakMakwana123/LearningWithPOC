//
//  HomeListView.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI

struct HomeListView : View {
   
    @State var contentList = [ContentList]()
    var memes :  Meme
    let gap: CGFloat = 8
    @State private var showAlert = false
    @State private var viewModal = HomeViewModal()
    
    func saveWorkoutData(){
    }
    func deleteWorkoutData(){
    
    }
    func buttonPressed(){
        debugPrint("Button Pressed")
//        Button("Tap to show alert") {
//                showAlert = true
//            }
//        .alert(isPresented: $showAlert) {
//            Alert(
//                title: Text("Unable to Save Workout Data"),
//                message: Text("The connection to the server was lost."),
//                primaryButton: .default(
//                    Text("Try Again"),
//                    action: saveWorkoutData
//                ),
//                secondaryButton: .destructive(
//                    Text("Delete"),
//                    action: deleteWorkoutData
//                )
//            )
//        }
    }
        
    
    var body: some View {
        VStack {
            HStack {
                CustomText(name:memes.name)
                Spacer()

                Button {
                    buttonPressed()
                    
                } label: {
                    Text("Tap")
                        .padding()
                        .foregroundColor(.white)
                        //.background(.red)
                        .cornerRadius(10)
                }
            }
            HStack {
                CustomText(name:"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
                Spacer()
            }.background(Color.red)
            
//            AsyncImage(url: URL(string: memes.url),
//                            content: { image in
//                                image.resizable()
//                                     .aspectRatio(contentMode: .fill)
//                                     .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            },
//                            placeholder: {
//                                ProgressView()
              //              })
            CustomText(name:"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
                .buttonStyle(.plain)
        } .buttonStyle(.plain)
           
       
    }
}
struct CreatorCell: View {
    @Binding var meme : Meme
    var body: some View {
        Text(meme.name ?? "Dipak")
    }
}

