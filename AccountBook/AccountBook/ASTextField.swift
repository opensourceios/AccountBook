//
//  ASTextField.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/2.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct ASTextField : UIViewRepresentable {
    var placeholder: String
    @Binding var value: String?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.text = value
        textField.placeholder = placeholder
        textField.delegate = context.coordinator
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        return textField
    }

    func updateUIView(_ textField: UITextField, context: UIViewRepresentableContext<ASTextField>) {
    }

    class Coordinator : NSObject, UITextFieldDelegate {
        var textField: ASTextField

        init(_ textField: ASTextField) {
            self.textField = textField
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                self.textField.value = updatedText
            } else {
                self.textField.value = textField.text
            }
            return true
        }
    }
}

struct ASTextField_Previews : PreviewProvider {
    static var previews: some View {
        ASTextField(placeholder: "Amount", value: .constant(""))
    }
}

