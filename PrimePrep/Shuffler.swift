//
//  Shuffler.swift
//  PrimePrep
//
//  Created by Cassidy Wang on 10/18/15.
//  Copyright © 2015 Cassidy Wang. All rights reserved.
//

import Foundation

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}