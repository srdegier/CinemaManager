//
//  EditRoomRowsView.swift
//  CinemaManager
//
//  Created by Stefan de Gier on 16/12/2024.
//

import SwiftUI

struct EditRoomRowsView: View {
    @Binding var rowSeats: [RowSeats]

    var body: some View {
        List {
            ForEach(Array(rowSeats.enumerated()), id: \.element.id) { index, row in
                HStack {
                    Button(action: {
                        rowSeats.remove(at: index)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    if let rowNumber = row.rowNumber {
                        VStack(alignment: .leading) {
                            Text("Rij: \(rowNumber)")
                            Text("Stoelen: \(row.seats.count)")
                        }
                    } else {
                        Text("Leeg ruimte")
                    }
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                }
            }
            .onMove(perform: moveTask)
        }

    }
    func moveTask(from source: IndexSet, to destination: Int) {
        rowSeats.move(fromOffsets: source, toOffset: destination)
    }
}
