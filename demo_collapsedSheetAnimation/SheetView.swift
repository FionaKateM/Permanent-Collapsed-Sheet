//
//  SheetView.swift
//  demo_collapsedSheetAnimation
//
//  Created by Fiona Kate Morgan on 03/07/2024.
//

import SwiftUI

struct SheetView: View {
    @State var screenExpanded = false
    @State var mealExpanded = 0
    @Namespace private var animation
    
    var screenHeight: CGFloat {
        if screenExpanded {
            return .infinity
        } else {
            return 100
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if screenExpanded {
                VStack(spacing: 0) {
                    Text("Week expanded view")
                        .padding(.top)
                    ForEach(0..<7) {dayIndex in
                        HStack {
                            Text(dayIndex.weekday().uppercased())
                                .lineLimit(1)
                                .minimumScaleFactor(0.01)
                                .matchedGeometryEffect(id: "text\(dayIndex)", in: animation)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.top)
                        .padding(.bottom, 2)
                        HStack {
                            ForEach(0..<3) { mealIndex in
                                MealDetailView(mealID: mealIndex, mealExpanded: $mealExpanded, expanded: screenExpanded)
                                    .matchedGeometryEffect(id: "shape\(dayIndex)\(mealIndex)", in: animation)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
                
            if !screenExpanded {
                HStack {
                    ForEach(0..<7) {dayIndex in
                        VStack(spacing: 0) {
                            Text(dayIndex.shortWeekday())
                                .lineLimit(1)
                                .minimumScaleFactor(0.01)
                                .matchedGeometryEffect(id: "text\(dayIndex)", in: animation)
                            MealDetailView(mealID: 0, mealExpanded: $mealExpanded, expanded: screenExpanded)
                                .matchedGeometryEffect(id: "shape\(dayIndex)\(0)", in: animation)
                            MealDetailView(mealID: 1, mealExpanded: $mealExpanded, expanded: screenExpanded)
                                .matchedGeometryEffect(id: "shape\(dayIndex)\(1)", in: animation)
                            MealDetailView(mealID: 2, mealExpanded: $mealExpanded, expanded: screenExpanded)
                                .matchedGeometryEffect(id: "shape\(dayIndex)\(2)", in: animation)
                        }
                        .frame(height: 30)
                        .padding(5)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: screenHeight)
        .background(.white)
        .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading:15, bottomLeading: 0, bottomTrailing: 0, topTrailing: 15)))
        .coordinateSpace(name: "sheet")
        
        // expand the sheet on tap
        .onTapGesture { location in
            if !screenExpanded {
                withAnimation {
                    screenExpanded = true
                }
            }
        }
        
        // swipe to shrink the sheet
        .gesture(
            DragGesture(minimumDistance: 10)
                .onChanged({ _ in
                    if screenExpanded {
                        withAnimation {
                            screenExpanded = false
                        }
                    }
                })
        )
        
    }
    
}





