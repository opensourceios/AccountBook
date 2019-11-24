//
//  AddingLabel.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/24.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct AddingLabel : View {
    @State private var labelName: String = ""
    @State private var canDone = false

    @Binding var isPresented: Bool

    // TODO: Memory Leak.
    var colorItems: [ColorItem] = LabelColor.allCases.map {
        ColorItem(labelColor: $0)
    }

    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Label Name", text: self.$labelName)
                }
                Section(header: Text("Color")) {
                    ForEach(self.colorItems, id: \.id) { item in
                        ColorRow()
                            .environmentObject(item)
                            .onTapGesture {
                                self.canDone = true
                                self.colorItems.forEach {
                                    $0.isSelected = false
                                }
                                item.isSelected.toggle()
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Add Label", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: doneButton)
        }
    }

    // MARK: Components

    private var cancelButton: some View {
        Button(action: {
            self.isPresented = false
        }) {
            Text("Cancel")
        }
    }

    private var doneButton: some View {
        Button(action: {
            self.isPresented = false
        }) {
            Text("Done")
        }
        .disabled(!canDone)
    }
}

struct AddingLabel_Previews : PreviewProvider {
    static var previews: some View {
        AddingLabel(isPresented: .constant(true))
    }
}
