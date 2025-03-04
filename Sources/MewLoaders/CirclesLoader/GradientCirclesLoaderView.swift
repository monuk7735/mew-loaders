//
//  GradientCirclesLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 11/02/25.
//

import SwiftUI

public struct GradientCirclesLoaderView: View {
    
    public init(
        colors: [Color] = [
            .blue,
            .yellow,
            .purple
        ],
        count: Int = 10,
        duration: TimeInterval = 5,
        isLoading: Bool = true
    ) {
        self.colors = colors
        self.count = count
        self.isLoading = isLoading
        self.duration = duration
    }
    
    private var colors: [Color]
    public var count: Int
    private var duration: TimeInterval
    
    private var isLoading: Bool
    
    public var body: some View {
        BaseCirclesLoaderView(
            items: Array(
                repeating: LinearGradient(
                    colors: colors,
                    startPoint: .top,
                    endPoint: .bottom
                )
                .scaledToFit()
                .clipShape(Circle())
                .padding(
                    10
                ),
                count: count
            ),
            duration: duration,
            isLoading: isLoading
        )
    }
}

#Preview {
    GradientCirclesLoaderView(
        isLoading: true
    )
}
