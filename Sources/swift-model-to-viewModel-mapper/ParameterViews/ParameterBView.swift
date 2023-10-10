//
//  ParameterBView.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

import SwiftUI

struct ParameterBView: View {
    
    let viewModel: ParameterBViewModel

    var body: some View {
        
        Button(action: viewModel.action) {
            
            Text(viewModel.parameter.value)
        }
    }
}

struct ParameterBView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ParameterBView(
            viewModel: .init(
                parameter: .init(value: "b"),
                action: {}
            )
        )
    }
}
