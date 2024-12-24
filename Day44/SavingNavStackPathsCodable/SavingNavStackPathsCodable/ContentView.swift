//
//  ContentView.swift
//  SavingNavStackPathsCodable
//
//  Created by Meriç Erkoşun on 24.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                        .toolbar {
                            Button("Home") {
                                pathStore.path.removeAll()
                            }
                        }
                }
        }
    }
}

struct DetailView: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

@Observable
class PathStore {
    
    var path: [Int] {
        didSet {
            save()
        }
    }
    
//    If you're using NavigationPath, you need only four small changes.
//    First, the path property needs to have the type NavigationPath rather than [Int]:
    
//    var path: NavigationPath {
//        didSet {
//            save()
//        }
//    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
            
//            Second, when we decode our JSON in the initializer we need to decode to a specific type, then use the decoded data to create a new NavigationPath:
//
//            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
//                path = NavigationPath(decoded)
//                return
//            }
        }
        
        path = []
        
//        Third, if decoding fails we should assign a new, empty NavigationPath instance to the path property at the end of the initializer:
//        path = NavigationPath()
    }
    
    func save() {
        
        //        And finally, the save() method needs to write the Codable representation of our navigation path. This is where things diverge just a little more from using a simple array, because NavigationPath doesn't require that its data types conform to Codable – it only needs Hashable conformance. As a result, Swift can't verify at compile time that there is a valid Codable representation of the navigation path, so we need to request it and see what comes back.
        //
        //        That means adding a check at the start of the save() method, which attempts to retrieve the Codable navigation path and bails out immediately if we get nothing back:
                
        //        guard let representation = path.codable else { return }
                
        //        do {
        //            let data = try JSONEncoder().encode(representation)
        //            try data.write(to: savePath)
        //        } catch {
        //            print("Failed to save navigation data")
        //        }
        
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

#Preview {
    ContentView()
}
