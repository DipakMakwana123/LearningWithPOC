//
//  SettingTopView.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct SettingTopView: View {
    var body: some View {
        VStack{
        HStack {
            ForEach((1...3),id:\.self) { _ in
                VStack {
                    HStack {
                        Image(systemName: "face.smiling.fill")
                            .foregroundColor(.white)
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.red)
                    .cornerRadius(10)
                    Text("John")
                    .foregroundColor(.white)
                    
                }
            }
        }
        HStack {
                Image(systemName: "pencil.circle")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    
                    .padding()
                Text("Edit Profile")
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width, height: 50)
            .background(Color.clear)
            .accentColor(.white)
        }
        
        .frame(width: UIScreen.main.bounds.width, height: 250)
        .background(Color.black)
        Divider()
            .background(Color.gray)
    }
}


