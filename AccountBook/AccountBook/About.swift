//
//  About.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/3.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct About: View {
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 16) {
                VStack(spacing: 4) {
                    Text("Current Version")
                        .modifier(TitleText())
                    Text("1.0")
                }
                VStack(spacing: 4) {
                    Text("Comments and Feedback")
                        .modifier(TitleText())
                    Text("QQ Group: 341207494")
                }
                VStack {
                    Text("You're welcome to make any comments on my product.")
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("About", displayMode: .inline)
            .navigationBarItems(leading: closeButton)
        }
    }

    private var closeButton: some View {
        Button(action: {
            self.presentation.wrappedValue.dismiss()
        }) {
            Text("Close")
        }
        .modifier(RedButton())
    }
}

extension About {
    struct TitleText : ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(.headline))
        }
    }

    struct ContentText : ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(.body))
        }
    }
}

#if DEBUG
struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
#endif
