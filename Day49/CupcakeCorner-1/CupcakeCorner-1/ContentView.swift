//
//  ContentView.swift
//  CupcakeCorner-1
//
//  Created by Meriç Erkoşun on 5.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var results: [Result] = []
    
    var body: some View {
        VStack {
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"),scale: 3)
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//                image
//                    .resizable()
//                    .scaledToFit()
//            } placeholder: {
//                ProgressView()
//            }
//                .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
            
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
            }
        }
        .padding()
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=sena+sener&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            
        } catch {
            print("Invalid data")
        }
    }
}

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

#Preview {
    ContentView()
}
