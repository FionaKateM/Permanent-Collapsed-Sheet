//
//  BackgroundView.swift
//  demo_collapsedSheetAnimation
//
//  Created by Fiona Kate Morgan on 03/07/2024.
//

import SwiftUI

struct BackgroundView: View {
    // no functionality, just to show that a functioning main view can sit behind the sheet
    @State var selected: [Int] = []
    var body: some View {
        List {
            ForEach(0..<100) { i in
                Button {
                    toggle(int: i)
                } label: {
                    HStack {
                        Text("ROW \(i)")
                        Spacer()
                        if selected.contains(i) {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    func toggle(int: Int) {
        if selected.contains(int) {
            selected.removeAll(where: {$0 == int})
        } else {
            selected.append(int)
        }
    }
}
