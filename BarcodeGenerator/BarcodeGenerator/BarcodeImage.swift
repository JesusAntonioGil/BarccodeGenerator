//
//  BarcodeImage.swift
//  BarcodeGenerator
//
//  Created by Jesus Antonio Gil on 17/2/24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins


public struct BarcodeImage {
    private let message: String
    private let generator = CIFilter.code128BarcodeGenerator()
    private let context = CIContext()
    
    
    public init(message: String) {
        self.message = message
    }
    
    
    public var body: some View {
        generator.message = Data(message.utf8)
        
        if let outputImage = generator.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            return Image(uiImage: uiImage)
        }
        
        return Image(systemName: "barcode")
    }
    
}
