//
//  OperationViewModel.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

import Foundation

final class OperationViewModel: ObservableObject {
    
    @Published private(set) var operation: Operation
    
    init(operation: Operation = .init(parameters: [])) {
        
        self.operation = operation
    }
    
    func continueButtonTapped() {
        
        // TODO: implement
    }
}
