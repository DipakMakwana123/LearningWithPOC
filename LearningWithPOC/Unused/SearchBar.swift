//
//  SearchBar.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI

class SearchModal: ObservableObject {
    @Published var text : String = String()
}

struct SearchBar: View {
    
   @EnvironmentObject var searchModal : SearchModal

   @State private var isEditing = false

   var body: some View {
       VStack {
           HStack {

               TextField("Search ...", text: self.$searchModal.text)
                   .padding(7)
                   .padding(.horizontal, 25)
                   .background(Color(.systemGray6))
                   .cornerRadius(8)
                   .padding(.horizontal, 10)
                   .onTapGesture {
                       self.isEditing = true
                   }

               if isEditing {
                   Button(action: {
                       self.isEditing = false
                       searchModal.text = ""

                   }) {
                       Text("Cancel")
                   }
                   .padding(.trailing, 10)
                   .transition(.move(edge: .trailing))
                   .animation(.default)
               }
           }
           Text(searchModal.text)
          // Text($searchModal.text)
       }
       
   }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text:"")
//    }
//}
