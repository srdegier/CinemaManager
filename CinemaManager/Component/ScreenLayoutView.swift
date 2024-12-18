//
//  ScreenLayoutView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 17/12/2024.
//

import SwiftUI

struct ScreenLayoutView: View {
    var body: some View {
        HStack {
            Text("Scherm")
                .font(.headline)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ScreenLayoutView()
}
