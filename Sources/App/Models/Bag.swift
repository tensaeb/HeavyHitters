//
//  File.swift
//  HeavyHitters
//
//  Created by Tensae on 09/05/2026.
//

import Vapor

enum BagStatus: String, Codable {
    case available, occupied, maintenance
}

struct BoxingBag: Content {
    var id: Int
    var status: BagStatus
}

actor BagStore {
    static let shared = BagStore()
    private var bags: [Int: BoxingBag] = [:]
    
    init() {
        for i in 1...12 {
            bags[i] = BoxingBag(id: i, status: .available)
        }
    }
    
    func getAll() -> [BoxingBag] {
        return bags.keys.sorted().compactMap { bags[$0] }
    }
    
    func toggle(id: Int) {
        guard var current = bags[id] else { return }
        
        switch current.status {
        case .available:
            current.status = .occupied
        case .occupied:
            current.status = .maintenance
        case .maintenance:
            current.status = .available
            
        }
    }
}
