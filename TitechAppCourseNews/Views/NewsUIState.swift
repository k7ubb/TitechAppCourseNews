//
//  NewsUIState.swift
//  TitechAppCourseNews
//
//  Created by 久保田聡 on 2021/10/06.
//

import Foundation

struct NewsUIState {
    var news: [CourseNews] = []
}

struct CourseNews: Identifiable {
    let id: String
    let title: String
    let course: String
    let teacher: String
    let date: String
}
