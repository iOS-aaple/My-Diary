//
//  model.swift
//  My Diary
//
//  Created by Aamer Essa on 15/12/2022.
//

import Foundation


class users:ViewController {
    
    static func login (email:String,password:String,completionHandler:@escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let url = URL(string: "http://localhost:4000/users/login")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json ", forHTTPHeaderField: "Content-Type")

            let body = [
                "email":email,
                "password":password
            ]


        request.httpBody = try? JSONSerialization.data(withJSONObject: body,options: .fragmentsAllowed)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()

    } // end login()
    
    
    static func getUserData (email:String,completionHandler:@escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string:"http://localhost:4000/users/getOne/\(email)")
       
        let session = URLSession.shared
       
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
       
        task.resume()
    } // end getUserData()
    
    static func signup (name:String,email:String,password:String,phoneNumber:String,birthday:String,completionHandler:@escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let url = URL(string: "http://localhost:4000/users/signup")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json ", forHTTPHeaderField: "Content-Type")

            let body = [
                "name":name,
                "email":email,
                "password":password,
                "birthday":birthday,
                "phoneNumber":phoneNumber
            ]


        request.httpBody = try? JSONSerialization.data(withJSONObject: body,options: .fragmentsAllowed)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
        
    } // end signup()
    
    
}
