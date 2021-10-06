//
//  NewsList.swift
//  TitechAppCourseNews
//
//  Created by 久保田聡 on 2021/10/06.
//

import SwiftUI

struct NewsList: View {
    @StateObject
    var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.uistate.news) {
                NewsRow(news: $0)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("お知らせ", displayMode: .inline)
            .onAppear {
                viewModel.appear()
            }
        }
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
    }
}
