//
//  ScrollViewUsage.swift
//  Moonshot-intro
//
//  Created by Meriç Erkoşun on 16.12.2024.
//

import SwiftUI

struct ScrollViewUsage: View {
    var body: some View {
        ScrollView (.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity) // Scroll özelliğini bütün ekrana yaymak için.
        }
    }
}

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

#Preview {
    ScrollViewUsage()
}
