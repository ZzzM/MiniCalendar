//
//  ContentView.swift
//  MiniCal
//
//  Created by zm on 2020/9/21.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    var body: some View {
        
        VStack(content: {
            Text(String.miniCalWidgetDisplayName)
                .font(.title)
                .padding()
            Button(action: {
                // Manual Rerfsh Widget
                WidgetCenter.shared.reloadAllTimelines()
            }, label: {
                Text("Refresh!")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
            })
            .background(Color.red)
            .cornerRadius(5)
            .shadow(color: .black, radius: 5, x: 5, y: 5)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.miniBackground)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}
