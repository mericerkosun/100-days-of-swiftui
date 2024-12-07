//
//  Observable.swift
//  iExpense
//
//  Created by Meriç Erkoşun on 7.12.2024.
//

import SwiftUI
import Observation

struct Observable: View {
    
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First Name", text: $user.firstName)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("Last Name", text: $user.lastName)
                .textFieldStyle(.roundedBorder)
                .padding()
                
        }
        .padding()
    }
}

// Observable right-click -> Expand Macro
@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

#Preview {
    Observable()
}
