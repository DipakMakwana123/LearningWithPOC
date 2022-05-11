//
//  HorizontalCell.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI

struct HorizontalCell: View {
    var memes : [Meme]
    @State var viewFrame: CGSize = .zero
    
    let cellHeight: CGFloat = 250
    let cellWidth: CGFloat = UIScreen.main.bounds.width / 2.5
    
    var body: some View {
       
        
        ScrollView(.horizontal, content: {
            HStack {
                ForEach(memes, id: \.self) { meme in
                    NavigationLink {
                      //  DetailView(meme: meme)
                    } label: {
                        VStack {
                            // Design the View
                        }
                        .frame(width: cellWidth, height: cellHeight)
                        .border(.white)
                        .background(Color.black.opacity(0.5))
                        .padding()
                    }
                 }
            }.background(Color.red)
            
            
        }).frame(width:UIScreen.main.bounds.width, height: cellHeight, alignment: .center)
        .background(Color.clear)
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
           print(geometry.size.width, geometry.size.height)

           DispatchQueue.main.async { viewFrame = geometry.size }
            print(viewFrame.width, viewFrame.height)
           return Text("qdlfld/fklfldfjldkjfljfldfjldsfjjfldjfldsjfldjfldjfdlfjldkjfldkfjdlkfjldsjfdlskfjdlfjdlskfjdlsfjdlkfjdslkfjdslkfjdslkfjdlksfjdlksfjdslkfdlksjfdklsfjdklsfjdlkfjdsklfjdslkfjr")
                   .frame(width: geometry.size.width)
       }
    

}

 
