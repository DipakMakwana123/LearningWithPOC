//
//  SettingView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 13/04/22.
//

import SwiftUI

struct SettingView: View {
    
    @StateObject var viewModal: SettingViewModal = SettingViewModal()
    
    var body: some View {

        NavigationView {
                VStack {
                    SettingTopView()
                    FormView(lists: $viewModal.lists)
                }
                .navigationTitle("More")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear(){
                UITableView.appearance().backgroundColor = .clear
            }
        }
  
}



//struct SettingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingView()
//    }
//}
