//
//  CustomSegmentControlView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 20/04/22.
//

import SwiftUI

struct HorizontalList: View {
    
    @State var   viewModal: LiveTVViewModal
    let margin: CGFloat = 8
    @State var selectedItem: LiveTVModal?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModal.lists,id:\.id) {  item in
                    Button(action: {
                       selectedItem = item
                        resetValue()
                    }, label: {
                        VStack {
                            Text(item.title)
                                .padding(4)
                                .background(Color.black)
                                .foregroundColor(Color.white)
                            if let selectedItem  = selectedItem,item.id == selectedItem.id {
                                        Divider()
                                    .frame(height:5)
                                    .background(Color.red)
                            }
                            Spacer()
                        }
                        .padding(margin)
                    }).buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    private func  resetValue(){
        selectedItem?.selected = false
        for var item in viewModal.lists {
            item.selected = false
            if let selected = selectedItem, item.id == selected.id {
                item.selected = true
                selectedItem?.selected = true
            }
        }
    }
    
}

struct CustomSegmentControlView: View {
    
    @ObservedObject var viewModal: LiveTVViewModal
    @State var selectedItem: LiveTVModal
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModal.lists,id:\.id) {  item in
                        TextCell(item: selectedItem, selectedItem: selectedItem, lists: viewModal.lists)
                    .onAppear{
                        selectedItem = item
                    }
                }
            }
        }
    }
    private func  resetValue(selectedItem: LiveTVModal){
        for var item in viewModal.lists {
            item.selected = false
            if item.id == selectedItem.id {
                item.selected = true
                self.selectedItem.selected = true
            }
        }
    }
}

struct TextCell: View {
   
    var item: LiveTVModal
    @State var selectedItem: LiveTVModal
    
    
    var lists:[LiveTVModal]
    
    let margin: CGFloat = 8
    
    var body: some View {
        
        Button(action: {
            selectedItem = item
            resetValue()

        }, label: {
            VStack {
                Text(item.title)
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                if item.id == selectedItem.id  {
                    Divider()
                        .frame(height:5)
                        .background(Color.red)
                }
                Spacer()
            }
            .padding(margin)
        })
    }
    private func  resetValue(){
        selectedItem.selected = false
        for var item in lists {
            item.selected = false
            if item.id == selectedItem.id {
                item.selected = true
                selectedItem.selected = true
            }
        }
    }
}
