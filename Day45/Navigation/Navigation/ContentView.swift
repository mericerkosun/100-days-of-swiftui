//
//  ContentView.swift
//  Navigation
//
//  Created by Meriç Erkoşun on 25.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("ToolBar Item View") {
                ToolBarItemView()
            }
            NavigationLink("Editable Navigation Title") {
                EditableNavTitle()
            }
            .navigationTitle("Title Goes Here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar(.visible,for: .navigationBar)
        }
    }
}

struct ToolBarItemView: View {
    var body: some View {
        NavigationStack {
            Text("Hello World!")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Confirm") {
                            //
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            //
                        }
                    }
                }
                .navigationBarBackButtonHidden()
        }
    }
}

struct EditableNavTitle: View {
    
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
                    Text("Hello, world!")
                .navigationTitle($title)
                        .navigationBarTitleDisplayMode(.inline)
                }
    }
}

#Preview {
    ContentView()
}
