//
//  OperationViewModel.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

import Foundation

final class OperationViewModel: ObservableObject {
    
    @Published private(set) var operation: Operation
    
    private let blackBoxGet: BlackBoxAPI.AsyncGet
    
    init(
        operation: Operation = .init(parameters: []),
        blackBoxGet: @escaping BlackBoxAPI.AsyncGet
    ) {
        self.operation = operation
        self.blackBoxGet = blackBoxGet
    }
    
    func updateParameterA(
        to newValue: Operation.Parameter.ParameterA
    ) {
        /// - Note: it would be much better to use something like [IdentifiedArray](https://github.com/pointfreeco/swift-identified-collections#introducing-identified-collections) to simplify access to array elements via ID.
        // TODO: move this to mutating method in Operation
        guard let index = operation.parameters.firstIndex(where: {
            
            if case .a = $0 { return true }
            return false
        }) else { return }
        
        operation.parameters[index] = .a(newValue)
    }
    
    func changeParameterB() {
        
        // TODO: move this to mutating method in Operation
        guard let index = operation.parameters.firstIndex(where: {
            
            if case .b = $0 { return true }
            return false
        }),
              let random = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement()
        else { return }
        
        
        operation.parameters[index] = .b(.init(value: .init(random)))
    }
    
    func continueButtonTapped() {
        
        #warning("dispatch to MainQueue, weakify self")
        
        blackBoxGet(operation) { result in
            
            // TODO: implement
            switch result {
            case let .failure(error):
                self.handleAPIError(error)
                
            case let .success(parameters):
                self.updateOperation(with: parameters)
            }
        }
    }
    
    private func handleAPIError(_ error: Error) {
        
        // TODO: implement
    }
    
    private func updateOperation(with parameters: [Operation.Parameter]) {
        
        // TODO: implement
    }
}

/// A namespace.
enum BlackBoxAPI {}

extension BlackBoxAPI {
    
    typealias Request = Operation
    typealias Success = [Operation.Parameter]
    typealias Result = Swift.Result<Success, Error>
    typealias Completion = (Result) -> Void
    typealias AsyncGet = (Request, @escaping Completion) -> Void
}
