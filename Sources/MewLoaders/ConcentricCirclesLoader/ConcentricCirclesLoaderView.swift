//
//  ConcentricCirclesLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 20/02/25.
//

import SwiftUI

public struct ConcentricCirclesLoaderView: View {
    
    public init(
        lineWidth: CGFloat = 2,
        maxDepth: Int = 7,
        startDepth: Int = 0,
        duration: TimeInterval = 10
    ) {
        self.lineWidth = lineWidth
        self.maxDepth = maxDepth
        self.startDepth = startDepth
        
        self.duration = duration
    }
    
    private var lineWidth: CGFloat
    
    private var maxDepth: Int
    private var startDepth: Int
    
    private var duration: TimeInterval
    
    @State private var angle = 0.0
    
    func getColor() -> Color {
        return .init(
            hue: .random(in: 0...1),
            saturation: .random(in: 0...1),
            brightness: .random(in: 0...1)
        )
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(
                    getColor()
                )
                .padding(lineWidth / 2)
            
            if startDepth < maxDepth {
                GeometryReader { geometry in
                    
                    let size = min(
                        geometry.size.width,
                        geometry.size.height
                    )
                    
                    ConcentricCirclesLoaderView(
                        lineWidth: lineWidth,
                        maxDepth: maxDepth,
                        startDepth: startDepth + 1
                    )
                    .frame(
                        height: size * 0.8
                    )
                    .frame(
                        width: size,
                        height: size,
                        alignment: .bottom
                    )
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center
                    )
                    .rotationEffect(
                        .degrees(
                            angle
                        )
                    )
                }
            }
        }
        .onAppear {
            withAnimation(
                .easeInOut(
                    duration: duration
                )
                .repeatForever(
                    autoreverses: false
                )
            ) {
                angle = 360 * Double(startDepth + 1)
            }
        }
    }
}

#Preview {
    ConcentricCirclesLoaderView(
        lineWidth: 1,
        maxDepth: 5,
        duration: 10
    )
}
