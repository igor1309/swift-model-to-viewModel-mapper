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
                
                VStack(spacing: 32) {
                    
                    ForEach(model.operation.parameters, content: parameterView)
                }
            }
            
            Button(action: model.continueButtonTapped) {
                
                Text("Continue")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func parameterView(
        parameter: Operation.Parameter
    ) -> some View {
        
        let mapper = ModelToViewModelMapper(model)
        
        switch mapper.map(parameter) {
        case let .a(viewModelA):
            ParameterAView(viewModel: viewModelA)
            
        case let .b(viewModelB):
            ParameterBView(viewModel: viewModelB)
        }
    }
}

extension Operation.Parameter: Identifiable {
    
    var id: Case {
        
        switch self {
        case .a: return .a
        case .b: return .b
        }
    }
    
    enum Case {
        case a, b
    }
}

extension ModelToViewModelMapper {
    
    init(_ model: OperationViewModel) {
        
        self.action = { event in
            
            switch event {
            case let .parameterA(parameterA):
                model.updateParameterA(to: parameterA)
                
            case .parameterB:
                model.changeParameterB()
            }
        }
    }
}

struct OperationView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OperationView(model: .preview)
    }
}
