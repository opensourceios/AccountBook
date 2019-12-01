//
//  AmountTextField.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/12/2.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import SwiftUI

struct AmountTextField : UIViewRepresentable {
    var text: String
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
        textField.placeholder = text
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
                if let currentValue = textField.text as NSString? {
                    let proposedValue = currentValue.replacingCharacters(in: range, with: string)
                    self.textField.value = proposedValue as String
                } else {
                    self.textField.value = nil
                }
                return true
            }
        }
    }
}

#if DEBUG
struct AmountTextField_Previews: PreviewProvider {
    static var previews: some View {
        AmountTextField(text: "Amount", value: .constant(""))
    }
}
#endif
