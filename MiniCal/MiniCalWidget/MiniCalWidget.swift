//
//  widget.swift
//  widget
//
//  Created by zm on 2020/9/21.
//

import WidgetKit
import SwiftUI


struct Provider: TimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }


    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        let tomorrow = MiniCalHelper.beginningOfTomorrow
        let entry = SimpleEntry(date: tomorrow)
        let timeline = Timeline(entries: [entry], policy: .after(tomorrow))
        completion(timeline)
        
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct widgetEntryView : View {
   // @Environment(\.widgetFamily) var family: WidgetFamily
    
    var entry: Provider.Entry
    var body: some View {

        SmallView()
            .background(Color.miniBackground)
            .widgetURL(.calendar)
        
    }
}

@main
struct MiniCalWidget: Widget {

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: .miniCalWidget, provider: Provider()) { entry in
            widgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName(String.miniCalWidgetDisplayName)
        .description(String.miniCalWidgetDescription)
    }
}

struct widget_Previews: PreviewProvider {
    static var previews: some View {
        widgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}


//MARK: SystemSmall
struct SmallView: View {

    let columns = [GridItem](repeating: .init(), count: WeekNames.count)
    
    var body: some View {
        
        VStack(content: {
            

            LazyVGrid(columns: [GridItem()], alignment: .leading) {
                Text(MiniCalHelper.monthName)
                    .foregroundColor(.red)
                    .font(.caption)
                    .fontWeight(.black)
            }

            LazyVGrid(columns: columns) {
                
                ForEach((0...6), id: \.self) {
                    
                    Text(WeekNames[$0])
                        .foregroundColor($0 == 0 || $0 == 6 ? .gray : .primary)
                        .fontWeight(.black)
                    
                }
            }
            
            LazyVGrid(columns: columns, spacing: MiniCalHelper.countOfItems > 35 ? 1:3) {
                
                ForEach((0..<MiniCalHelper.countOfItems), id: \.self) {
             
                    let color: Color = $0 % 7 == 0 || $0 % 7 == 6 ? .gray: .primary
                    let isToday = $0 == MiniCalHelper.indexOfToday
                    let foregroundColor: Color = isToday ? .white : color
                    
                    Text(MiniCalHelper.items[$0])
                        .fontWeight(.bold)
                        .frame(width: 16, height: 16)
                        .foregroundColor(foregroundColor)
                        .background(isToday ? Color.red : Color.miniBackground)
                        .cornerRadius(16/2)

                }
            }
            
            
        })
        .font(.caption2)
        .padding()
        
        
    }

    
}



