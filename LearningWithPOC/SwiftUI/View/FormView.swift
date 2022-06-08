//
//  FormView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct FormView: View {
    @Binding var lists: [Setting]
    @State var isShowingDetailView = false
    
    var body: some View {
        Form {
            VStack {
                NavigationLink(destination:  SettingDetail(), isActive: $isShowingDetailView) {
                Button(action: {
                    debugPrint("Clicked")
                    isShowingDetailView = true
                }, label: {
                    ForEach(lists, id: \.id) { result in
                        HStack {
                            Image(systemName: result.image)
                                .padding()
                            Text(result.title)
                            Spacer()
                        }
                        Divider()
                    }
                 })
                }
            }
            .listRowBackground(Color.black)
        }
        .foregroundColor(Color.white)
        .background(Color.black)
    }
}

