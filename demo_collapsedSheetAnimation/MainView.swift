//
//  ContentView.swift
//  demo_collapsedSheetAnimation
//
//  Created by Fiona Kate Morgan on 03/07/2024.
//

import SwiftUI

struct MainView: View {

    var body: some View {
            ZStack {
                BackgroundView()
                VStack {
                    Spacer()
                    SheetView()
                        .shadow(radius: 5)
                }
            }
            .ignoresSafeArea(edges: .bottom)
    }
}
