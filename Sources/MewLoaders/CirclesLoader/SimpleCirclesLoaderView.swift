//
//  SimpleCirclesLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 24/02/25.
//

import SwiftUI

public struct SimpleCirclesLoaderView: View {
    
    public init(
        color: Color = .black,
        duration: TimeInterval = 2,
        isLoading: Bool = true
    ) {
        self.color = color
        self.isLoading = isLoading
        self.duration = duration
    }
    
    private var color: Color
    
    private var isLoading: Bool
    
    private var duration: TimeInterval
    
    public var body: some View {
        BaseCirclesLoaderView(
            items: Array(
                repeating: Circle().fill(color).padding(5),
                count: 15
            ),
            duration: duration,
            isLoading: isLoading
        )
    }
}

#Preview {
    SimpleCirclesLoaderView(
        isLoading: true
    )
}
