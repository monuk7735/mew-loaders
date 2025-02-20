//
//  BaseCirclesLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 10/02/25.
//

import SwiftUI

public struct BaseCirclesLoaderView<Content: View>: View {
    
    public var items: [Content]
    public var isLoading: Bool = true
    
    public var duration: TimeInterval = 5
    
    @State private var angle: Double = 0
    
    public var body: some View {
        GeometryReader { geometry in
            
            let size = min(
                geometry.size.width,
                geometry.size.height
            ) - 20
            
            ZStack {
                ForEach(
                    Array(0..<items.count),
                    id: \.self
                ) { index in
                    items[index]
                        .rotation3DEffect(
                            .degrees(
                                Double(index * 360) / Double(items.count) + angle
                            ),
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                        .frame(
                            width: (3.14 * size) / (Double(items.count) * 1.3)
                        )
                        .frame(
                            width: size,
                            height: size,
                            alignment: .top
                        )
                        .rotationEffect(
                            .degrees(
                                Double(index * 360) / Double(items.count)
                            )
                        )
                }
            }
            .frame(
                width: size,
                height: size
            )
            .rotationEffect(.degrees(-angle / Double(items.count)))
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
        }
        .onChange(of: self.isLoading) { isLoading in
            if isLoading {
                withAnimation(
                    .linear(
                        duration: self.duration
                    )
                    .repeatForever(autoreverses: false)
                ) {
                    angle = -720
                }
            } else {
                withAnimation {
                    angle = 0
                }
            }
        }
        .onAppear {
            if isLoading {
                withAnimation(
                    .linear(
                        duration: self.duration
                    )
                    .repeatForever(autoreverses: false)
                ) {
                    angle = -720
                }
            }
        }
    }
}


#Preview {
    BaseCirclesLoaderView(
        items: Array(
            repeating: Image(
                systemName: "circle.fill"
            ).resizable().scaledToFit().padding(16),
            count: 10
        )
    )
}
