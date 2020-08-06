//
//  UIApplication+Extension.swift
//  AccountBook
//
//  Created by Mason Sun on 2019/11/30.
//  Copyright © 2019 Mason Sun. All rights reserved.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
