//
//  ContentView.swift
//  Introduction
//
//  Created by Dogus Yigit Ozcelik on 2.04.2021.
//

import SwiftUI

enum SectionType: String, CaseIterable {
    case section1 = "Section 1"
    case section2 = "Section 2"
    case section3 = "Section 3"
}

struct ListItem: Identifiable {
    var id = UUID()
    var description: String
    var sectionType: SectionType
}

struct ContentView: View {
    
    @State var listItems = [
        ListItem(description: "item - 1", sectionType: .section1),
        ListItem(description: "item - 2", sectionType: .section1),
        ListItem(description: "item - 3", sectionType: .section1),
        
        ListItem(description: "item - 4", sectionType: .section2),
        ListItem(description: "item - 5", sectionType: .section2),
        ListItem(description: "item - 6", sectionType: .section2),
        
        ListItem(description: "item - 7", sectionType: .section3),
        ListItem(description: "item - 8", sectionType: .section3),
        ListItem(description: "item - 9", sectionType: .section3)
    ]
    
    var body: some View {
        List {
            ForEach(SectionType.allCases, id: \.rawValue) { sectionType in
                Section(header: Text(sectionType.rawValue)) {
                    ForEach(listItems.filter { $0.sectionType == sectionType }) { item in
                        Text(item.description)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
