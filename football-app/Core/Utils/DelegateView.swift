//
//  DelegateView.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import Foundation

class DelegateView<Input> {
    private(set) var accept: ((Input) -> Void)?
    
    func subscribe<Context: AnyObject>(to context: Context, with onNext: @escaping (Context, Input) -> Void) {
        print("#S object \(context)")
        self.accept = { [weak context] input in
            guard let object = context else {
                return
            }
            onNext(object, input)
        }
    }
}
