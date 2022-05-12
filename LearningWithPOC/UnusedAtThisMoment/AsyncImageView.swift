//
//  AsyncImageView.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI

struct AsyncImageView: View {
    var urlString : String = ""
    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: urlString),
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200,alignment:.center)
                    //.frame(maxWidth: .infinity, maxHeight: .infinity)
            },
                       placeholder: {
                ProgressView()
            }).background(.gray)
        } else {
            // Fallback on earlier versions
        }
    }
}
