//
//  GetAllPeople.swift
//  StarWars
//
//  Created by Ryan Holstein on 5/23/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import Foundation


class StarWarsModel {
    
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "http://swapi.co/api/people/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "http://swapi.co/api/films/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
