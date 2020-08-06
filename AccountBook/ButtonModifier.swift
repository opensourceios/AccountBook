//
//  ButtonModifier.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/1.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct RedButton : ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.red)
    }
}
