//
//  GradientSquaresLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 20/02/25.
//

import SwiftUI

public struct GradientSquaresLoaderView: View {
    
    public init(
        colors: [Color],
        count: Int = 10,
        duration: TimeInterval = 10,
        isLoading: Bool = true
    ) {
        self.colors = colors
        self.count = count
        self.isLoading = isLoading
        self.duration = duration
    }
    
    private var colors: [Color]
    private var count: Int
    private var duration: TimeInterval
    
    private var isLoading: Bool
    
    public var body: some View {
        BaseSquaresLoaderView(
            items: Array(0...(count - 1)).map { index in
                LinearGradient(
                    colors: colors,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            },
            duration: duration,
            isLoading: isLoading
        )
    }
}

#Preview {
    ZStack {
        Color.white
            .ignoresSafeArea(edges: .all)
        
        GradientSquaresLoaderView(
            colors: [
                .blue
            ]
        )
        .padding()
    }
}
