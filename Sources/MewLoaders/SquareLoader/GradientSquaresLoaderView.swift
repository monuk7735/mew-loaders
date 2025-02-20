//
//  GradientSquaresLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 20/02/25.
//

import SwiftUI

public struct GradientSquaresLoaderView: View {
    
    public var colors: [Color] = [
        .green
    ]
    
    public var count: Int = 10
    
    public var isLoading: Bool
    
    public var duration: TimeInterval = 10
    
    public var body: some View {
        BaseSquaresLoaderView(
            items: Array(0...(count - 1)).map { index in
                LinearGradient(
                    colors: colors,
                    startPoint: .leading,
                    endPoint: .trailing
                )
            },
            isLoading: isLoading,
            duration: duration
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
            ],
            count: 12,
            isLoading: true
        )
        .padding()
    }
}
