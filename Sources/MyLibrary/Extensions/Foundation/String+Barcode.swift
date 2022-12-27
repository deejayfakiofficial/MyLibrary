//
//  String+Barcode.swift
//  
//
//  Created by Станислав Терентьев on 26.12.2022.
//

import Foundation
import UIKit

public extension String {
    
    func generateBarcode() -> UIImage? {
        let data = self.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIPDF417BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}
