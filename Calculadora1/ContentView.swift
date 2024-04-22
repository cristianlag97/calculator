//
//  ContentView.swift
//  Calculadora1
//
//  Created by Cristian David Laguna Aldana on 20/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var  viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            GeometryReader { proxy in
                VStack {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text(viewModel.textFieldValue)
                                .foregroundColor(.white)
                                .font(.system(size: 100, weight: .regular))
                                //.frame(width: 100)
                                .padding(.trailing, 40)
                        }
                    }
                    VerticalButtonStack(
                        viewModel: viewModel,
                        data: Matrix.firstSectionData, columns: Matrix.firstSectionGrid(proxy.size.width * 0.25),
                        width: proxy.size.width
                    )
                    VerticalButtonStack(
                        viewModel: viewModel,
                        data: Matrix.secondSectionData, columns: Matrix.secondSectionGrid(proxy.size.width * 0.25),
                        width: proxy.size.width
                    )
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
