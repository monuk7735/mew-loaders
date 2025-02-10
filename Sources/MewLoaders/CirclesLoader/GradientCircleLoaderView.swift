//
//  GradientCircleLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 11/02/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct GradientCircleLoaderView: View {
    
    public var isLoading: Bool
    
    public var duration: TimeInterval = 5
    
    public var body: some View {
        LinearGradient(
            colors: [
                .red,
                .blue,
                .yellow,
                .purple
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .mask {
            BaseCircleLoaderView(
                items: Array(
                    repeating: Circle(),
                    count: 25
                ),
                isLoading: isLoading,
                duration: duration
            )
        }
    }
}

#Preview {
    if #available(iOS 15.0, *) {
        GradientCircleLoaderView(isLoading: true)
    } else {
        // Fallback on earlier versions
    }
}
