//
//  NavigationLinkUsage.swift
//  Moonshot-intro
//
//  Created by Meriç Erkoşun on 16.12.2024.
//

import SwiftUI

struct NavigationLinkUsage: View {
    var body: some View {
        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
            List(0..<30) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    NavigationLinkUsage()
}
