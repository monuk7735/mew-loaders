//
//  BaseCircleLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 10/02/25.
//

import SwiftUI


struct BaseCircleLoaderView<Content: View>: View {
    
    var items: [Content]
    var isLoading: Bool
    
    var duration: TimeInterval = 5
    
    @State private var zAngle: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            
            var size = min(
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
                                Double(index * 360) / Double(items.count) + zAngle
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
            .rotationEffect(.degrees(-zAngle / Double(items.count)))
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
                    zAngle = -720
                }
            } else {
                withAnimation {
                    zAngle = 0
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
                    zAngle = -720
                }
            }
        }
    }
}

struct BaseCircleLoaderView_Preview: View {
    
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                BaseCircleLoaderView(
                    items: Array(
                        repeating: AsyncImage(
                            url: URL(string: "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg"),
                            content: { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                            },
                            placeholder: {
                                ProgressView()
                            }
                        ),
                        count: 55
                    ),
                    isLoading: isLoading
                )
            }
            
            Button("Toggle") {
                isLoading.toggle()
            }
        }
    }
}


#Preview {
    BaseCircleLoaderView_Preview()
}
