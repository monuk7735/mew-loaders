//
//  SimpleSquaresLoaderView 2.swift
//  MewLoaders
//
//  Created by Monu Kumar on 24/02/25.
//

import SwiftUI

public struct SimpleSquaresLoaderView: View {
    
    public init(
        color: Color = .black,
        count: Int = 8,
        duration: TimeInterval = 10,
        isLoading: Bool = true
    ) {
        self.color = color
        self.count = count
        self.isLoading = isLoading
        self.duration = duration
    }
    
    private var color: Color
    private var count: Int
    private var duration: TimeInterval
    
    private var isLoading: Bool
    
    public var body: some View {
        BaseSquaresLoaderView(
            items: Array(
                repeating: color,
                count: count
            ),
            duration: duration,
            isLoading: isLoading
        )
    }
}

#Preview {
    ZStack {
        Color.white
            .ignoresSafeArea(
                edges: .all
            )
        
        SimpleSquaresLoaderView()
            .padding()
    }
}
