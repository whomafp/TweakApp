//
//  APIServices.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//

import Foundation
import Combine

let urlAPI = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
class APIServices {
    var chartDataPublishers : AnyPublisher<Chart?,Error> {
        let url : URL = URL(string: urlAPI)!
        return URLSession.shared.dataTaskPublisher(for: url).map{
            $0.data }.decode(type: Chart?.self, decoder: JSONDecoder()).receive(on: RunLoop.main).eraseToAnyPublisher()
        }
}
