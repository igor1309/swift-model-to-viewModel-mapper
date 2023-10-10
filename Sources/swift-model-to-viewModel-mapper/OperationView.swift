//
//  OperationView.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

import SwiftUI

struct OperationView: View {
    
    @ObservedObject private var model: OperationViewModel
    
    init(model: OperationViewModel) {
        
        self.model = model
    }
    
    var body: some View {
        
        VStack {
            
            ScrollView {
                
            }
            
            Button(action: model.continueButtonTapped) {
                
                Text("Continue")
            }
        }
    }
}

struct OperationView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OperationView(model: .preview)
    }
}

private extension OperationViewModel {
    
    convenience init(
        parameters: [Operation.Parameter] = []
    ) {
        self.init(operation: .init(parameters: parameters))
    }
    
    static let preview: OperationViewModel = .init(
        parameters: .preview
    )
}

private extension Array where Element == Operation.Parameter {
    
    static let preview: Self = [
        .a(.init(a: "a")),
        .b(.init(b: "b")),
        .c(.init(c: "c")),
        .d(.init(d: "d")),
    ]
}
