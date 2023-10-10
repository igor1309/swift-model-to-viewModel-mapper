//
//  PreviewContent.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

extension OperationViewModel {
    
    static let preview: OperationViewModel = .init(
        parameters: .preview
    )
    
    convenience init(
        parameters: [Operation.Parameter] = []
    ) {
        self.init(
            operation: .init(parameters: parameters),
            blackBoxGet: { _,_ in }
        )
    }
}

extension Array where Element == Operation.Parameter {
    
    static let preview: Self = [
        .a(.a3),
        .b(.init(value: "b")),
    ]
}
