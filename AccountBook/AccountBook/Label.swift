//
//  Label.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/20.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct Label : View {
    @Environment(\.editMode) var mode

    var body: some View {
        ZStack {
            Text("Shopping")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
        }
        .background(Color.orange)
        .cornerRadius(4)
    }
}

struct Label_Previews: PreviewProvider {
    static var previews: some View {
        Label()
        //            .previewLayout(.sizeThatFits)
    }
}
