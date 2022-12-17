//
//  posts.swift
//  My Diary
//
//  Created by Aamer Essa on 17/12/2022.
//

import Foundation


class posts:ViewController {
    
    
    static func getAllPosts(id:String,completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let url = URL(string: "http://localhost:4000/posts/\(id)")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        
        task.resume()
    }
    
    static func deletePost(id:String,completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        let url = URL(string: "http://localhost:4000/posts/\(id)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json ", forHTTPHeaderField: "Content-Type")
        
     
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
        
    
    }
    
    static func updatePost (id:String,ownerId:String,title:String,created_At:String,content:String,completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        
        let url = URL(string: "http://localhost:4000/posts/update/\(id)")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json ", forHTTPHeaderField: "Content-Type")
        
            let body = [
                "title":title,
                "created_At":created_At,
                "ownerID":ownerId,
                "content":content
            ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body,options: .fragmentsAllowed)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
        
    }
    
    static func AddNewPost (ownerId:String,title:String,created_At:String,content:String,completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        
        let url = URL(string: "http://localhost:4000/posts/addNewPost")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json ", forHTTPHeaderField: "Content-Type")
        
            let body = [
                "title":title,
                "created_At":created_At,
                "ownerID":ownerId,
                "content":content
            ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body,options: .fragmentsAllowed)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
        
    }

    
    
    
}
