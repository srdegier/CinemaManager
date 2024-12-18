//
//  EditSeatView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI

struct EditSeatView: View {
    var seatNumber: Int?
    @Binding var isSelected: Bool

    var body: some View {
        Toggle(isOn: $isSelected) {
            HStack {
                Group {
                    if let seatNumber = seatNumber {
                        Text("\(seatNumber)")
                    } else {
                        Text("X")
                    }
                }
                .font(.caption2)
                .foregroundColor(Color.primary)
            }
            .padding(4)
        }
        .frame(width: 50, height: 50)
        .toggleStyle(.button)
        .background(isSelected ? Color.green.opacity(0.2) : Color.clear)
        .tint(.clear)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(isSelected ? Color.green : Color.gray, lineWidth: 1)
        )
    }

}
