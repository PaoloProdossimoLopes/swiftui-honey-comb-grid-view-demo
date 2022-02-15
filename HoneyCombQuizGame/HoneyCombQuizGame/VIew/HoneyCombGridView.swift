//
//  HoneyCombGridView.swift
//  HoneyCombQuizGame
//
//  Created by Paolo Prodossimo Lopes on 15/02/22.
//

import SwiftUI

struct HoneyCombGridView<Content: View, Item>: View where Item: RandomAccessCollection {
    
    var content: ((Item.Element) -> Content)
    var item: Item
    
    @State var width: CGFloat = 0
    
    init(
        items: Item,
        @ViewBuilder content: @escaping ((Item.Element) -> Content))
    {
        self.content = content
        self.item = items
    }
    
    var body: some View {
        VStack(spacing: -16) {
            ForEach(setUpHoneyCombGrid().indices, id: \.self) { index in
                
                HStack(spacing: 4) {
                    ForEach(setUpHoneyCombGrid()[index].indices, id: \.self) { subIndex in
                        content(setUpHoneyCombGrid()[index][subIndex])
                            .frame(width: width / 4)
                            .offset(x: setOffset(index: index))
                    }
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .coordinateSpace(name: "HoneyComb")
        .overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(key: WidthKey.self, value: proxy.frame(in: .named("HoneyComb")).width - proxy.frame(in: .named("HoneyComb")).minX)
                    .onPreferenceChange(WidthKey.self) { width in
                        self.width = width
                    }
            }
        }
    }
    
    //Generating HoneyComb grids
    //Honey Comb pattern wil be
    //4,3,4,3 ....
    private func setUpHoneyCombGrid() -> [[Item.Element]] {
        var rows: [[Item.Element]] = []
        var itemsAtRow: [Item.Element] = []
        
        var count: Int = 0
        
        item.forEach { itemA in
            itemsAtRow.append(itemA)
            count += 1
            
            if itemsAtRow.count >= 3 {
                
                if rows.isEmpty && itemsAtRow.count == 4 {
                    rows.append(itemsAtRow)
                    itemsAtRow.removeAll()
                }
                
                else if let last = rows.last, last.count == 4 && itemsAtRow.count == 3 {
                    rows.append(itemsAtRow)
                    itemsAtRow.removeAll()
                }
                
                else if let last = rows.last, last.count == 3 && itemsAtRow.count == 4 {
                    rows.append(itemsAtRow)
                    itemsAtRow.removeAll()
                }
            }
            
            if count == item.count {
                if let last = rows.last {
                    
                    if rows.count >= 2 {
                        let previous = (rows[rows.count - 2].count == 4 ? 3 : 4)
                        
                        if (last.count + itemsAtRow.count) <= previous {
                            rows[rows.count - 1].append(contentsOf: itemsAtRow)
                            itemsAtRow.removeAll()
                        } else {
                            rows.append(itemsAtRow)
                            itemsAtRow.removeAll()
                        }
                        
                    } else {
                        if (last.count + itemsAtRow.count) <= 4 {
                            rows[rows.count - 1].append(contentsOf: itemsAtRow)
                            itemsAtRow.removeAll()
                        } else {
                            rows.append(itemsAtRow)
                            itemsAtRow.removeAll()
                        }
                    }
                    
                } else {
                    rows.append(itemsAtRow)
                    itemsAtRow.removeAll()
                }
            }
        }
        
        return rows
    }
    
    private func setOffset(index: Int) -> CGFloat {
        let current = setUpHoneyCombGrid()[index].count
        let offset = (width/4)/2
        if index != 0 {
            let previous = setUpHoneyCombGrid()[index - 1].count
            
            if (current == 1) && (previous % 2 == 0) {
                return 0
            }
            
            if previous % current == 0 {
                return -offset
            }
        }
        return 0
    }
}

struct HoneyCombGridView_Previews: PreviewProvider {
    static var previews: some View {
//        HoneyCombGridView()
        //user a content here to see all
        ContentView()
    }
}


struct WidthKey: PreferenceKey {
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    static var defaultValue: CGFloat = 0
}
