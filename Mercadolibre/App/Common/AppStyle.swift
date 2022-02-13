//
//  Styles.swift
//  Mercadolibre
//
//  Created by Juan Hurtado on 13/02/22.
//

import Foundation
import UIKit

struct AppStyle {   
    struct Font {
        enum Size: CGFloat {
            case header = 30
            case title = 18
            case subtitle = 16
            case body = 14
        }
        
        enum Weight: String {
            case regular = "AvenirNext-Regular"
            case medium = "AvenirNext-Medium"
        }
        
        static func get(_ weight: Weight, size: Size) -> UIFont {
            UIFont(name: weight.rawValue, size: size.rawValue)!
        }
    }
}
