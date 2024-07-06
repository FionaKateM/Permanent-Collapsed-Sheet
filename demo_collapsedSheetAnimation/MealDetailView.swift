//
//  MealDetailView.swift
//  demo_collapsedSheetAnimation
//
//  Created by Fiona Kate Morgan on 06/07/2024.
//

import SwiftUI

struct MealDetailView: View {
    @Namespace private var MealDetailsView
    var mealID: Int
    @Binding var mealExpanded: Int
    var expanded: Bool
    
    var body: some View {
        if expanded {
            Button {
                withAnimation(.easeInOut(duration: 1)) {
                    mealExpanded = mealID
                }
            } label: {
                if mealID == mealExpanded {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.yellow)
                            .frame(height: 60)
                        Text("Yummy recipe")
                        // line limited to 1 and min scale factor set small so it is a single line that 'grows' in size as the animation happens
                            .lineLimit(1)
                            .minimumScaleFactor(0.01)
                    }
                    .matchedGeometryEffect(id: "shape", in: MealDetailsView)
                } else {
                    RoundedRectangle(cornerRadius: 20)
                        .matchedGeometryEffect(id: "shape", in: MealDetailsView)
                        .foregroundStyle(.pink)
                        .frame(width: 50, height: 60)
                }
            }
        } else {
            if mealID == 0 {
                // breakfast - top edges rounded
                UnevenRoundedRectangle(topLeadingRadius: 5, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 5, style: .continuous)
                    .frame(width: 30, height: 10)
                    .foregroundStyle(.green)
                
            } else if mealID == 1 {
                // lunch - no rounded edges
                UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 0, style: .continuous)
                    .frame(width: 30, height: 10)
                    .foregroundStyle(.blue)
                
            } else {
                // dinner - bottom edges rounded
                UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 5, bottomTrailingRadius: 5, topTrailingRadius: 0, style: .continuous)
                    
                    .frame(width: 30, height: 10)
                    .foregroundStyle(.red)
            }
        }
    }
}
