//
//  DownloadView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct DownloadView: View {
    
    
    var body: some View {
        
        NavigationView {
            SegmentPicker()
            .navigationTitle("Download")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct DownloadView_Previews: PreviewProvider {
//    static var previews: some View {
//        DownloadView()
//    }
//}
