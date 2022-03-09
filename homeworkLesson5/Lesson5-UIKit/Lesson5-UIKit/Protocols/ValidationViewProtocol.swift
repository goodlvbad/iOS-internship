//
//  ValidationViewProtocol.swift
//  Lesson5-UIKit
//
//  Created by Светлана on 09.03.2022.
//

import Foundation
import UIKit

protocol ValidationViewProtocol: AnyObject {
    
    var validateButton: UIButton { get }
    var backButton: UIButton { get }
    
    func setValidationText(isValid: Bool)
    func setValidationTextColor(isValid: Bool)
    func getTextFromTextField() -> String
}
