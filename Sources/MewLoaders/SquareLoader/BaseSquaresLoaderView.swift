//
//  BaseSquaresLoaderView.swift
//  MewLoaders
//
//  Created by Monu Kumar on 20/02/25.
//

import SwiftUI

public struct BaseSquaresLoaderView<Content: View>: View {
    
    public init(
        items: [Content],
        duration: TimeInterval = 10,
        isLoading: Bool = true
    ) {
        self.items = items
        self.isLoading = isLoading
        self.duration = duration
        
        self._isAttached = .init(
            initialValue: Array(
                repeating: false,
                count: items.count
            )
        )
    }
    
    @Namespace private var nameSpace
    
    private var items: [Content]
    private var duration: TimeInterval
    
    private var isLoading: Bool
    
    @State private var index = -1
    @State private var isLineReversed = true;
    @State private var isAttached: [Bool]
    
    @State private var angle: Double = 0
    
    @State private var timer: Timer? = nil
    
    public var body: some View {
        GeometryReader { geometry in
            
            let size = min(
                geometry.size.height,
                geometry.size.width
            )
            
            let squareSize = (size / 2) / Double(items.count)
            
            ZStack {
                ForEach(
                    Array(1...items.count),
                    id: \.self
                ) { index in
                    if !isAttached[index - 1] {
                        items[index - 1]
                            .frame(
                                width: squareSize,
                                height: squareSize
                            )
                            .matchedGeometryEffect(
                                id: index,
                                in: nameSpace
                            )
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .top
                            )
                            .rotationEffect(
                                .degrees(
                                    (Double(index) / Double(items.count)) * 360.0
                                )
                            )
                    }
                }
                
                VStack(
                    spacing: -0.5
                ) {
                    ForEach(
                        isLineReversed
                        ? Array(1...items.count).reversed()
                        : Array(1...items.count),
                        id: \.self
                    ) { index in
                        if isAttached[index - 1] {
                            items[index - 1]
                                .frame(
                                    width: squareSize,
                                    height: squareSize
                                )
                                .matchedGeometryEffect(
                                    id: index,
                                    in: nameSpace
                                )
                        } else {
                            items[index - 1]
                                .opacity(0)
                                .frame(
                                    width: squareSize,
                                    height: squareSize
                                )
                        }
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
                .rotationEffect(
                    .degrees(
                        angle
                    )
                )
            }
            .frame(
                width: size,
                height: size
            )
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
        }
        .rotationEffect(
            .degrees(
                (Double(-1) / Double(items.count)) * 360.0
            )
        )
        .onChange(of: self.isLoading) { isLoading in
            if isLoading {
                withAnimation(
                    .linear(
                        duration: duration
                    )
                    .repeatForever(
                        autoreverses: false
                    )
                ) {
                    angle = 360
                }
                
                timer = Timer.scheduledTimer(
                    withTimeInterval: duration / Double(items.count),
                    repeats: true
                ) { _ in
                    index += 1
                    
                    if index >= items.count {
                        isLineReversed.toggle()
                        index = 0
                    }
                    
                    withAnimation(
                        .easeOut(
                            duration: 0.2
                        )
                    ) {
                        isAttached[index].toggle()
                    }
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
                        duration: duration
                    )
                    .repeatForever(
                        autoreverses: false
                    )
                ) {
                    angle = 360
                }
                
                timer = Timer.scheduledTimer(
                    withTimeInterval: duration / Double(items.count),
                    repeats: true
                ) { _ in
                    index += 1
                    
                    if index >= items.count {
                        isLineReversed.toggle()
                        index = 0
                    }
                    
                    withAnimation(
                        .easeOut(
                            duration: 0.2
                        )
                    ) {
                        isAttached[index].toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.white
            .ignoresSafeArea(edges: .all)
        
        BaseSquaresLoaderView(
            items: Array(
                repeating: Rectangle().fill(.black),
                count: 8
            ),
            duration: 4,
            isLoading: true
        )
        .padding()
        
    }
}
