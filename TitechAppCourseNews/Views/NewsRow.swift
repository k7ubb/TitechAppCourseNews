//
//  NewsRow.swift
//  TitechAppCourseNews
//
//  Created by 久保田聡 on 2021/10/06.
//

import SwiftUI

struct NewsRow: View {
    let news: CourseNews
    var body: some View {
        HStack{
            Color("Main")
                .frame(maxWidth: 6, maxHeight: .infinity)
            VStack(alignment: .leading, spacing: 8.0){
                Text(news.title)
                    .padding(.vertical, 8.0)
                Text(news.course)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                Text(news.teacher)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
                Text(news.date)
                    .font(.system(size: 13))
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 8.0)
            Spacer()
            Text("Zoom")
                .foregroundColor(Color("Main"))
                .padding(.trailing, 7.82)
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(news: CourseNews(id: "1", title: "お知らせ", course: "あああ", teacher: "ああああ", date: "2020/10/07"))
            .previewLayout(.sizeThatFits)
    }
}
