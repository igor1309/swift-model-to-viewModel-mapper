//
//  ModelToViewModelMapper.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

struct ModelToViewModelMapper {
    
    let action: (Event) -> Void
}

extension ModelToViewModelMapper {
    
    func map(_ parameter: Operation.Parameter) -> ParameterViewModel {
        
        switch parameter {
        case let .a(parameterA):
            return .a(
                .init(
                    parameter: parameterA,
                    updateParameter: { parameterA in
                        
                        action(.parameterA(parameterA))
                    }
                )
            )
            
        case let .b(parameterB):
            return .b(
                .init(
                    parameter: parameterB,
                    action: { action(.parameterB) }
                )
            )
        }
    }
}

