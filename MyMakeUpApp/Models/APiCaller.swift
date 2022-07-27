//
//  APiCaller.swift
//  carProject
//
//  Created by Jennifer Chukwuemeka on 24/06/2022.
//

import Foundation
import UIKit

final class ApiCaller {
    static let shared = ApiCaller()
    
    private init() {}
    
    func fetchproduct(completion: @escaping(Result<[MakeoverElement], Error>) -> Void) {
        guard let url = Constants.makeupURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let makeup = try JSONDecoder().decode ([MakeoverElement].self, from: data)
                    completion(.success(makeup))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
    
    
    func search(with query: String, completion: @escaping (Result<[MakeoverElement], Error>)-> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        guard let url = Constants.searchURLString else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode([MakeoverElement].self, from: data)
                    completion(.success(result))
                }
                catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func searchData(with query: String, completion: @escaping (Result<[MakeoverElement], Error>)->Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        guard let url = Constants.searchURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode([MakeoverElement].self, from: data)
                    
                    completion(.success(result))
                }
                catch{
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        
    }
   
}
