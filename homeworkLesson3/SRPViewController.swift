//
//  SRPViewController.swift
//  SOLIDDRYKISS
//
//  Created by Александров Роман Витальевич on 09.02.2022.
//

import Foundation
import UIKit

class SRPViewController: UIViewController {
    
    struct NutrientCalculator {
        func calculateDailtyNutrients(proportionType: ProportionType,
                                      caloriesCalculatorType: CaloriesCalculationType) -> Nutrients {
            var targetCalories: Int = {
                switch caloriesCalculatorType {
                case .mifflin:
                    // some calculation
                    return 1200
                case .harrisBenedict:
                    // some calculation
                    return 1400
                }
            }
            
            var nutrients: Nutrients = {
                switch proportionType {
                case .paleo:
                    // use calories to calculate
                    // nutrients
                    return Nutrients(carbs: 4, fats: 10, proteins: 8)
                case .keto:
                    // use calories to calculate
                    // nutrients
                    return Nutrients(carbs: 6, fats: 1, proteins: 20)
                }
            }
            
            return nutrients
        }
    }
}
