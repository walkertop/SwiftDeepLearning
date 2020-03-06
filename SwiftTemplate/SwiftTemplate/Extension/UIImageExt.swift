//
//  UIImageExt.swift
//  SwiftDeepLearning
//
//  Created by Bin.Guo on 2019/12/6.
//  Copyright © 2019 walker彬. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
  /// 压缩图片数据-不压尺寸
  ///
  /// - Parameters:
  ///   - maxLength: 最大长度，单位kib
  /// - Returns: Data类型
  func compressImageToDataOnlength(maxLength: Int) -> Data? {
    guard let vData = self.jpegData(compressionQuality: 1) else { return nil }

    if vData.count < maxLength {
      return vData
    }
    var compress: CGFloat = 0.9
    guard var data = self.jpegData(compressionQuality: compress) else { return nil }
    while data.count > maxLength && compress > 0.01 {
      
      compress -= 0.02
      if compress < 0 {
        data  = resizeImageToData(scale: 3)!
      } else {
        data = self.jpegData(compressionQuality: compress)!
      }
    }
    return data
  }
  
  /// 压缩图片数据-不压尺寸
  ///
  /// - Parameters:
  ///   - maxLength: 最大长度，单位kib
  /// - Returns: UIImage类型
  func compressImageToImageOnlength(maxLength: Int) -> UIImage? {
    guard let vData = self.jpegData(compressionQuality: 1) else { return nil }
    if vData.count < maxLength {
      return UIImage.init(data: vData)
    }
    var compress: CGFloat = 0.9
    guard var data = self.jpegData(compressionQuality: compress) else { return nil }
    while data.count > maxLength && compress > 0.01 {
      compress -= 0.02
      if compress < 0 {
        data  = resizeImageToData(scale: 3)!
      } else {
        data = self.jpegData(compressionQuality: compress)!
      }
    }
    return  UIImage.init(data: data)
  }
  
  /// 尺寸压缩
  ///
  /// - Parameter scale: 尺寸压缩的比例
  /// - Returns: UImage?
  func resizeImageToImage(scale: CGFloat) -> UIImage? {
    let size = CGSize(width: self.size.width / scale, height: self.size.height / scale)
    let newRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    var newImage: UIImage!
    UIGraphicsBeginImageContext(newRect.size)
    newImage = UIImage(cgImage: self.cgImage!, scale: 1, orientation: self.imageOrientation)
    newImage.draw(in: newRect)
    newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage
  }
  
  /// 尺寸压缩
  ///
  /// - Parameter scale: 尺寸压缩的比例
  /// - Returns: Data?
  func resizeImageToData(scale: CGFloat) -> Data? {
    let size = CGSize(width: self.size.width / scale, height: self.size.height / scale)
    let newRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    var newImage: UIImage!
    UIGraphicsBeginImageContext(newRect.size)
    newImage = UIImage(cgImage: self.cgImage!, scale: 1, orientation: self.imageOrientation)
    newImage.draw(in: newRect)
    newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage.jpegData(compressionQuality: 0.5)
  }
  
  func resizeImageToData(size: CGSize) -> Data? {
    let originData = self.jpegData(compressionQuality: 1)

    UIGraphicsBeginImageContext(size)
    draw(in: CGRect(origin: .zero, size: size))
    let compressedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    var data = compressedImage?.jpegData(compressionQuality: 1)

    return data
  }
  
  /// 微信图片的缩略图压缩
  ///
  /// - Returns: Data?

  func compressWechatThumbnailToData() -> Data? {
    let defaultSize = CGSize(width: 90, height: 90)
    var data = resizeImageToData(size: defaultSize)
    while data?.count ?? 0 > 1024 * 32 {
      data = resizeImageToData(size: defaultSize.resize(scale: 2))
    }
    return data
  }
  
  /// 设置图片透明度
  ///
  /// - Parameter alpha: 图片透明度
  func translucent(alpha: CGFloat) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(self.size, false, 0)
    let bounds = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
    self.draw(in: bounds, blendMode: .screen, alpha: alpha)
    let translucentImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return translucentImage
  }
}

extension CGSize {
  public func resize(scale: CGFloat) -> CGSize {
    return CGSize(width: width / scale, height: height / scale)
  }
}
