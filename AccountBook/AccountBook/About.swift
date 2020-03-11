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
            VStack(alignment: .center, spacing: 24) {
                Image("Icon-60")
                    .cornerRadius(8)
                HStack(spacing: 4) {
                    Text("Current Version")
                    Text("1.1")
                }
                VStack(spacing: 16) {
                    Text("Comments and Feedback")
                    Text("QQ Group: 341207494")
                    Text("Email: mason.sunjiabin@gmail.com")
                    Text("You're welcome to make any comments on this APP")
                    .multilineTextAlignment(.center)
                }
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
                .font(.system(.body))
        }
    }

    struct ContentText : ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(.body))
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
