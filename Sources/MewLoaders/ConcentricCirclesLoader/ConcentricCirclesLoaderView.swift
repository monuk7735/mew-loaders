//
//  ConcentricCirclesLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 20/02/25.
//

import SwiftUI

public struct ConcentricCirclesLoaderView: View {
    
    public var lineWidth: CGFloat = 2
    
    public var maxDepth: Int = 5
    fileprivate var depth: Int = 0
    
    @State private var angle = 0.0
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(
                    lineWidth: lineWidth
                )
                .padding(lineWidth / 2)
            
            if depth < maxDepth {
                GeometryReader { geometry in
                    
                    let size = min(
                        geometry.size.width,
                        geometry.size.height
                    )
                    
                    ConcentricCirclesLoaderView(
                        lineWidth: lineWidth,
                        maxDepth: maxDepth,
                        depth: depth + 1
                    )
                    .frame(
                        height: size * 0.6
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
                    duration: Double(
                        5
                    )
                )
                .repeatForever(
                    autoreverses: false
                )
            ) {
                angle = 360 * Double(depth + 1)
            }
        }
    }
}

#Preview {
    ConcentricCirclesLoaderView(
        maxDepth: 5
    )
}
