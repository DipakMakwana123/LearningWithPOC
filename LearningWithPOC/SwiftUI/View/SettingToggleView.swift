//
//  SettingToggleView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct SettingToggleView: View {
    
    var subItem: TitleDescriptionModal
    @Binding var isToggle: Bool
    let margin: CGFloat = 8
    
    var body: some View {
        if subItem.isToggle {
            HStack {
                Toggle(subItem.title, isOn: $isToggle)
                    .padding(margin)
            }
        }
        else {
            VStack {
                HStack {
                    Text(subItem.title)
                        .padding(margin)
                    Spacer()
                }
                if let desc = subItem.description , !desc.isEmpty {
                    HStack {
                        Text(desc)
                            .padding(margin)
                        Spacer()
                    }
                }
            }
        }
    }
}

//struct SettingToggleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingToggleView()
//    }
//}
