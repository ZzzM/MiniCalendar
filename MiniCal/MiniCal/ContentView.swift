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
        
        ZStack(content: {
            
            Color.miniBackground.edgesIgnoringSafeArea(.all)
            
            VStack(content: {

                Text(String.miniCalWidgetDisplayName)
                    .font(.title)
                    .padding()
                
                Spacer()
                
                HStack(
                    spacing: 30,
                    content: {
                        button("Calendar") {
                            self.showingCalendarAlert = true
                        }
                        .alert(isPresented: $showingCalendarAlert) {
                            Alert(title: Text("Open Calendar？"),
                                  primaryButton: .default(Text("OK"),
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
                                  primaryButton: .default(Text("OK"),
                                                          action: {
                                                            WidgetCenter.shared.reloadAllTimelines()
                                                          }),
                                  secondaryButton: .cancel())
                        }
                    })
                
                Spacer()
                
                Text(MiniCalHelper.version)
                    .font(.caption)
                    .padding()

            })
        })

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}
