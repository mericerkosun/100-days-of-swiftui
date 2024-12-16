//
//  ScrollingGrid.swift
//  Moonshot-intro
//
//  Created by Meriç Erkoşun on 16.12.2024.
//

import SwiftUI

struct ScrollingGrid: View {
    
    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
        
//        GridItem(.adaptive(minimum: 80)),
        
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
        
//        Horizontal
//        
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
    }
}

#Preview {
    ScrollingGrid()
}
