//
//  RequestCaller.swift
//  MitraRuma
//
//  Created by Tivo Yudha on 11/06/21.
//

import Foundation
import RxSwift
import RxRetroSwift

public class RequestCaller {
  
  private lazy var decoder = JSONDecoder()
  private var urlSession:URLSession
  
  public init(config:URLSessionConfiguration) {
    urlSession = URLSession(configuration: config)
  }
  
  public convenience init() {
    self.init(config: URLSessionConfiguration.default)
  }
  
  public func call<ItemModel:Decodable, DecodableErrorModel:DecodableError>(_ request: URLRequest)
    -> Observable<Result<ItemModel, DecodableErrorModel>> {
      
      return Observable.create { [weak self] observer in
        
        guard let _self = self else { return Disposables.create() }
        let task = _self.urlSession
          .dataTask(with: request) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse{
              let statusCode = httpResponse.statusCode
              
              do {
                let _data = data ?? Data()
                #if DEBUG
                print("METHOD: \(request.httpMethod ?? "")\nHEADERS: \(request.allHTTPHeaderFields ?? [:])\nURL : \(httpResponse.url?.absoluteString ?? "No Url") \nPARAMS : \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "No Params")\nRESPONSE : \(String(data: _data, encoding: .utf8) ?? "")")
                #endif
                if (200...399).contains(statusCode) {
                  let objs = try _self.decoder.decode(ItemModel.self, from: _data)
                  observer.onNext(Result.successful(objs))
                } else {
                  var error = try _self.decoder.decode(DecodableErrorModel.self, from: _data)
                  error.errorCode = statusCode
                  observer.onNext(Result.failure(error))
                }
              } catch {
                var decodingError = DecodableErrorModel()
                decodingError.errorCode = -1
                decodingError.errorDetail = "\(error)"
                observer.onNext(Result.failure(decodingError))
              }
            }
            observer.on(.completed)
        }
        task.resume()
        return Disposables.create {
          task.cancel()
        }
      }
  }
  
  public func call<DecodableErrorModel:DecodableError>(_ request: URLRequest)
    -> Observable<Result<RawResponse, DecodableErrorModel>> {
      
      return Observable.create { [weak self] observer in
        
        guard let _self = self else { return Disposables.create() }
        
        let task = _self.urlSession
          .dataTask(with: request) { (data, response, error) in
            let _data = data ?? Data()
            if let httpResponse = response as? HTTPURLResponse{
              let statusCode = httpResponse.statusCode
                #if DEBUG
                    print("METHOD: \(request.httpMethod ?? "")\nHEADERS: \(request.allHTTPHeaderFields ?? [:])\nURL : \(httpResponse.url?.absoluteString ?? "No Url") \nPARAMS : \(String(data: request.httpBody!, encoding: .utf8) ?? ""))\nRESPONSE : \(String(data: _data, encoding: .utf8) ?? "")")
                #endif
              
              do {
                if (200...399).contains(statusCode) {
                  let plainResponse = RawResponse(statusCode: statusCode, data: _data)
                  observer.onNext(Result.successful(plainResponse))
                } else {
                  var error = try _self.decoder.decode(DecodableErrorModel.self, from: _data)
                  error.errorCode = statusCode
                  observer.onNext(Result.failure(error))
                }
                
              } catch {
                var decodingError = DecodableErrorModel()
                decodingError.errorCode = -1
                decodingError.errorDetail = "\(error)"
                observer.onNext(Result.failure(decodingError))
              }
              observer.on(.completed)
            }
        }
        task.resume()
        return Disposables.create {
          task.cancel()
        }
      }
  }
}


