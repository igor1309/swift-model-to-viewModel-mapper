//
//  ParameterAViewModel.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

struct ParameterAViewModel {
    
    typealias Parameter = Operation.Parameter.ParameterA
    
    let parameter: Parameter
    let updateParameter: (Parameter) -> Void
}
