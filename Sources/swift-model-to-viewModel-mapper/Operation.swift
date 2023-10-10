//
//  Operation.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

struct Operation {
    
    /// - Note: it would be much better to use something like [IdentifiedArray](https://github.com/pointfreeco/swift-identified-collections#introducing-identified-collections) to simplify access to array elements via ID.
    var parameters: [Parameter]
    
    enum Parameter: Hashable {
        
        case a(ParameterA)
        case b(ParameterB)
        
        enum ParameterA: String, CaseIterable {
            
            case  a1, a2, a3
        }
        
        struct ParameterB: Hashable {
            
            let value: String
        }
    }
}
