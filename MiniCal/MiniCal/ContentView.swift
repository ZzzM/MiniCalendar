//
//  ContentView.swift
//  MiniCal
//
//  Created by zm on 2020/9/21.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    
    @State private var showingCalendarAlert = false
    @State private var showingRefreshAlert = false
    
    func button(_ title: String, action: @escaping () -> Void) -> some View {
        return Button(action: action, label: {
            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding()
        })
        .frame(width: 120)
        .background(Color.red)
        .cornerRadius(5)
        .shadow(color: .black, radius: 5, x: 5, y: 5)
    }

    
    var body: some View {
        
        VStack(content: {
            Text(String.miniCalWidgetDisplayName)
                .font(.title)
                .padding()
            
            
            HStack(
                spacing: 30,
                content: {
                    button("Calendar") {
                        self.showingCalendarAlert = true
                    }
                    .alert(isPresented: $showingCalendarAlert) {
                        Alert(title: Text("Open System's Calendar？"),
                              primaryButton: .default(Text("Yes"),
                                                      action: {
                                                        UIApplication.shared.open(.calendar)
                                                      }),
                              secondaryButton: .cancel())
                    }
                    
                    button("Refresh") {
                        self.showingRefreshAlert = true
                    }
                    .alert(isPresented: $showingRefreshAlert) {
                        Alert(title: Text("Refresh Mini Calendar Widget？"),
                              primaryButton: .default(Text("Yes"),
                                                      action: {
                                                        WidgetCenter.shared.reloadAllTimelines()
                                                      }),
                              secondaryButton: .cancel())
                    }
                })
            
            
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
