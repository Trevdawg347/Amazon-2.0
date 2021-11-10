//
//  Firebase.swift
//  Amazon 2.0
//
//  Created by Wendy Buhler on 11/9/21.
//

import Foundation

class Firebase: ObservableObject {
    static let shared = Firebase()
    @Published var isSignedIn: Bool = false
    
}
