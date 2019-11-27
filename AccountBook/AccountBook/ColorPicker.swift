//
//  ColorPicker.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/27.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ColorPicker : View {
    @Environment(\.presentationMode) private var presentation

    @Binding var color: BillColor

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(color: .constant(.red))
    }
}
