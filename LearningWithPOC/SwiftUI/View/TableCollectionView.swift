//
//  TableCollectionView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 11/04/22.
//

import SwiftUI

struct TableCollectionView: View {
    let accentColor: Color = .black
    @State var memes = [Meme]()
    @ObservedObject private  var searchModal =  SearchModal()
    private let viewModal: SwiftUIViewModal = SwiftUIViewModal(apiManager: APIManager())
    
    var body: some View {
        
       // VStack {
        
            NavigationView {
                Color.black.opacity(1).ignoresSafeArea()
                    
                .navigationBarItems(
                    
                leading:
                    Button(action: {
                        print("SF Symbol button pressed...")
                }) {
                    Image(systemName: "antenna.radiowaves.left.and.right.circle")
                        .accentColor(accentColor)
                },
                trailing:
                                        
                        HStack {
                            
                            Button(action: {
                                print("Search Button Pressed")
                            }) {
                                Image(systemName: "magnifyingglass")
                                
                            }.accentColor(accentColor)
                            Button(action: {
                                print("Search Button Pressed")
                            }) {
                                Image(systemName: "gear")
                                
                            }.accentColor(accentColor)
                })
            }
            .frame(height: 50)
            VStack {
                List {

                    ForEach((1...10), id: \.self) {
                        Section(header: Text("Section \($0)")) {
                            HorizontalCell(memes: self.memes)
                        }
                    }
                }
                .background(Color.orange)
            }
            .onAppear(){
                    // API Call
                    viewModal.getMemesData(compilation: {memes in
                        debugPrint(memes)
                        self.memes = memes
                    })
            }
            .environmentObject(searchModal)

    }
}
struct MyNavigationView: View {
    
    var body: some View {
        
        NavigationView {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
            
                .navigationBarItems(leading:
                                        Button(action: {
                    print("SF Symbol button pressed...")
                }) {
                    Text("Ds TV")
                        .accentColor(.white)
                },
                                    trailing:
                                        
                                        HStack {
                    
                    Button(action: {
                        print("Search Button Pressed")
                    }) {
                        Image(systemName: "antenna.radiowaves.left.and.right.circle")
                        
                    }.accentColor(.white)
                    Button(action: {
                        print("Search Button Pressed")
                    }) {
                        Image(systemName: "magnifyingglass")
                        
                    }.accentColor(.white)
                    
                })
            
        }
    }
}
