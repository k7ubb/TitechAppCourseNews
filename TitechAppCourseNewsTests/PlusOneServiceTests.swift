//
//  PlusOneServiceTests.swift
//  TitechAppCourseNews
//
//  Created by 久保田聡 on 2021/10/06.
//

import XCTest

class PlusOneServiceTests: XCTestCase {

    func testPlusOne() throws {
        let result = PlusOneService.plusOne(i: Int.max)
        let expect = Int.min
        XCTAssertEqual(result, expect)
    }

}
