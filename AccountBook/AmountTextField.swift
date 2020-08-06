//
//  AmountTextField.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/2.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct AmountTextField : UIViewRepresentable {
    var placeholder: String
    @Binding var value: String?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.font = .systemFont(ofSize: 30, weight: .semibold)
        textField.keyboardType = .decimalPad
        return textField
    }

    func updateUIView(_ textField: UITextField, context: UIViewRepresentableContext<AmountTextField>) {
        textField.text = value
        textField.placeholder = placeholder
    }

    class Coordinator : NSObject, UITextFieldDelegate {
        var textField: AmountTextField

        init(_ textField: AmountTextField) {
            self.textField = textField
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if textField.text?.contains(".") == true && string == "." {
                self.textField.value = textField.text
                return false
            } else {
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
}

struct AmountTextField_Previews: PreviewProvider {
    static var previews: some View {
        AmountTextField(placeholder: "Amount", value: .constant(""))
    }
}
