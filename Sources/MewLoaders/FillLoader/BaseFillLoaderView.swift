//
//  BaseFillLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 10/02/25.
//

import SwiftUI

@available(iOS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, *)
struct BaseFillLoaderView<Content: View>: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
            .overlay {
//                overlay()
            }
            
    }
}

#Preview {
    if #available(iOS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, *) {
        BaseFillLoaderView(
//            overlay: {
//                Text("fff")
//            }
        ) {
            HStack {
                Text("Downloading")
                    .font(.body.bold())
                Spacer()
                Text("83%")
                    .font(.title3.bold())
            }
            .padding(8)
            .padding(.horizontal, 4)
            .background {
                Color.gray
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
        }
    }
}
