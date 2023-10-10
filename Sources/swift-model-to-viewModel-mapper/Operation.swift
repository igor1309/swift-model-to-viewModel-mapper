//
//  Operation.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

struct Operation {
    
    var parameters: [Parameter]
    
    enum Parameter: Hashable {
        
        case a(A)
        case b(B)
        case c(C)
        case d(D)
        
        struct A: Hashable {
            
            let a: String
        }
        struct B: Hashable {
            
            let b: String
        }
        struct C: Hashable {
            
            let c: String
        }
        struct D: Hashable {
            
            let d: String
        }
    }
}
