//
//  PostParser.swift
//  HelloRest
//
//  Created by mobapp12 on 29/01/2019.
//  Copyright © 2019 mobapp12. All rights reserved.
//

import Foundation

class PostParser{
    
    static func getAllPosts() -> [UserPosts]{
        //op welk adress staat de data?
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts")!
        //Starten lege array
        var posts = [UserPosts]()
        //indien iets faalt zoals verkeerde data/ geen verbinding
        do {
            //ruwe data van url binnenhalen
            let data = try Data.init(contentsOf: url)
            //voorlopige test, komt er iets binnen
            print(data)
            //data start met array
            let jsonArray = try JSONSerialization.jsonObject(with: data) as! [NSObject]
            
            //array overlopen
            for item in jsonArray {
                // value for key geeft generiek obect terug, moeten we nog casten
                let id = item.value(forKey: "id") as! Int
                let userId = item.value(forKey: "userId") as! Int
                let title = item.value(forKey: "title") as! String
                let body = item.value(forKey: "body") as! String
                
                let  currentPost = UserPosts.init(id: id, userID: userId, title: title, body: body)
                
                posts.append(currentPost)
            }
        }catch{
            print("\'t werkt ni")
        }
        return posts
        
        
    }
}
