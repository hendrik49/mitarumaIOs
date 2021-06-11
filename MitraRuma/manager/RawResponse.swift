//
//  RawResponse.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation

public struct RawResponse {
  
  public var statusCode:Int
  public var data:Data?
  
  init(statusCode:Int, data:Data?) {
    self.statusCode = statusCode
    self.data       = data
  }
}
