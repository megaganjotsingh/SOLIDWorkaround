//
//  Completion.swift
//  NetworkingSample
//
//  Created by Admin on 21/05/23.
//

import Foundation

enum Completion<A> {
    case success(A)
    case failure(Error)
}

extension Completion {
    var value: A? {
        if case .success(let a) = self {
            return a
        } else {
            return .none
        }
    }
    @discardableResult
    func next<B>(_ f: ((A) -> Completion<B>)) -> Completion<B> {
        switch self {
        case .success(let x):
            return f(x)
        case .failure(let error):
            return .failure(error)
        }
    }
}
