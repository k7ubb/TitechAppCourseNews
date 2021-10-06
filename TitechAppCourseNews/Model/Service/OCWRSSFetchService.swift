//
//  OCWRSSFetchService.swift
//  TitechAppCourseNews
//
//  Created by 久保田聡 on 2021/10/06.
//

import Foundation
import Kanna

struct OCWRSSFetchService {
    static func fetch(callback: @escaping ([RSSItem]) -> Void ) {
        print("a")
        URLSession.shared.dataTask(with: URL(string: "https://secure.ocw.titech.ac.jp/ocwi/index.php?module=Ocwi&action=Rss&type=1&id=qbdiSaNs9rn5M")!) { data, response, error in
            print("b")
            callback(RSSParser.parse(data: data!))
        }
        .resume()
        print("c")
    }
}

struct RSSParser {
    static func parse(data: Data) -> [RSSItem] {
        let xml = try! XML(xml: data, encoding: .utf8)
        return xml.css("item").map { i in
            let title = i.css("title").first!.text!
            let splitTitle = title.components(separatedBy: "】")
            let course: String
            if splitTitle.count > 1 {
                course = splitTitle[1]
            }
            else{
                course = ""
            }
            let teacher = i.css("author").first!.text!
            let date =  i.css("pubDate").first!.text!
            let description = i.css("description").first!.text!
            return RSSItem(title: title, course: course, teacher: teacher, date: date, description: description)
        }
    }
}

struct RSSItem {
    let title: String
    let course: String
    let teacher: String
    let date: String
    let description: String
}
