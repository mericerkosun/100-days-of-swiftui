//
//  ValidatingForms.swift
//  CupcakeCorner-1
//
//  Created by Meriç Erkoşun on 14.01.2025.
//

import SwiftUI

struct ValidatingForms: View {
    
    @State private var username = ""
    @State private var email = ""
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ValidatingForms()
}
