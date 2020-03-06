//
//  TemplateModel.swift
//  SwiftDeepLearning
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker彬. All rights reserved.
//

import Foundation

struct TemplateModel: Decodable {
  
  let firstName: String
  let lastName: String
  let introduction: String
  let title: String
  let avatarFilename: String

  enum CodingKeys : String, CodingKey {
    case firstName = "first_name"
    case lastName = "last_name"
    case avatarFilename = "avatar_filename"
    case title
    case introduction
  }
  
}
