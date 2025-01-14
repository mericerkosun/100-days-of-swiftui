//
//  AddingCodableToObservable.swift
//  CupcakeCorner-1
//
//  Created by Meriç Erkoşun on 14.01.2025.
//

import SwiftUI

struct AddingCodableToObservable: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

@Observable
class User: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Taylor"
}

#Preview {
    AddingCodableToObservable()
}
