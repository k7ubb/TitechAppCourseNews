//
//  NewsViewModel.swift
//  TitechAppCourseNews
//
//  Created by 久保田聡 on 2021/10/06.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published
    var uistate = NewsUIState()
    
    func appear() {
        OCWRSSFetchService.fetch { rss in
            let news: [CourseNews] = rss.map { r in
                print(r.description.matches0("https://\\w+web\\.zoom\\.us/j/[\\w/\\?=]+"))
                print(r.description.matches0("https://\\w+web\\.zoom\\.us/meeting/register/[\\w/\\?=]+"))
                return CourseNews(id: r.title, title: r.title, course: r.course, teacher: r.teacher, date: r.date)
            }
            DispatchQueue.main.async { [weak self] in
                self?.uistate.news = news
            }
        }
    }
}
