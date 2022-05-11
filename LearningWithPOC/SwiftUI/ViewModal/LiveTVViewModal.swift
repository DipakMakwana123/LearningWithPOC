//
//  LiveTVViewModal.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 20/04/22.
//

import Foundation

class LiveTVViewModal: ObservableObject{
    
    //@Published var selectedItem =  LiveTVModal(selected: false)
    
    @Published var lists: [LiveTVModal] = [
        
        LiveTVModal(title: "All Channels", selected: false, subItems: [
            VideoList(title: "Origins",
                      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      videoURL: "https://bit.ly/swswift",
                      time: "11:30 : 12:00",
                      minutes: "200"),
            
        ]),
        LiveTVModal(title: "Cartoon Network",selected: false,subItems: [
            VideoList(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        LiveTVModal(title: "Zee Sports", selected: false, subItems: [
            
            VideoList(title: "Sports",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "Ten Sports",  selected: false,subItems: [
            
            VideoList(title: "Sports", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "Sports TV", selected: false, subItems: [
            VideoList(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        LiveTVModal(title: "All Channels", selected: false, subItems: [
            
            VideoList(title: "Sports", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "203"),
        ]),
        LiveTVModal(title: "All Channels", selected: false, subItems: [
            VideoList(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        LiveTVModal(title: "All Channels",  selected: false,subItems: [
            VideoList(title: "Origins", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift",time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        LiveTVModal(title: "All Channels", selected: false, subItems: [
            VideoList(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "200"),
            
        ]),
        LiveTVModal(title: "All Channels", selected: false, subItems: [
            VideoList(title: "Origins",description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book", videoURL: "https://bit.ly/swswift", time: "11:30 : 12:00", minutes: "200"),
            
        ])

    ]
}


struct LiveTVModal: Identifiable {
    var id = UUID()
    var title: String
    var selected: Bool
    var subItems: [VideoList]?
    
//    init(id: UUID = UUID(),title:String = String() , selected:Bool,subItems:[VideoList]? = nil){
//        self.id = id
//        self.title = title
//        self.selected = selected
//        self.subItems = subItems
//    }
}

struct VideoList: Identifiable{
    let id = UUID()
    let title: String
    let description: String
    let videoURL: String
    let time: String
    let minutes: String
}
