//
//  ParameterAView.swift
//  
//
//  Created by Igor Malyarov on 10.10.2023.
//

import SwiftUI

struct ParameterAView: View {
    
    let viewModel: ParameterAViewModel
    
    var body: some View {
        
        Picker(
            "Select",
            selection: .init(
                get: { viewModel.parameter },
                set: viewModel.updateParameter
            )
        ) {
            ForEach(ParameterAViewModel.Parameter.allCases) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.segmented)
    }
}

extension Operation.Parameter.ParameterA: Identifiable {
    
    var id: Self { self }
}

struct ParameterAView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ParameterAView(
            viewModel: .init(
                parameter: .a1,
                updateParameter: { _ in }
            )
        )
    }
}
