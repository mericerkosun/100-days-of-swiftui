//
//  TextEditorUsing.swift
//  Bookworm-Preparation
//
//  Created by Meriç Erkoşun on 19.02.2025.
//

import SwiftUI

struct TextEditorUsing: View {
    
    @AppStorage("notes") private var notes = ""
    var body: some View {
        NavigationStack {
//            TextEditor(text: $notes)
//                .navigationTitle("Notes")
//                .padding()
//                .background(Color(white: 0.9))
            
            TextField("Enter Your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    TextEditorUsing()
}
