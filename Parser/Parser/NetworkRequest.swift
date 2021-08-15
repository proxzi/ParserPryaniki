//
//  NetworkRequest.swift
//  Parser
//
//  Created by Dmitry on 12.08.2021.
//

import Foundation

class NetworkRequest {
    static func sendRequest(url: String, complition: @escaping (_ someStruct: SomeStruct) -> ()) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let someStruct = try decoder.decode(SomeStruct.self, from: data)
                complition(someStruct)
            } catch {
                print("Error decode json: \n", error.localizedDescription)
            }

        }
        task.resume()
    }
}
