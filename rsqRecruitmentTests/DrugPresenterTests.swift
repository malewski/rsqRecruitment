//
//  DrugPresenterTests.swift
//  rsqRecruitmentTests
//
//  Created by Jan Malewski on 04/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import XCTest
@testable import rsqRecruitment

class DrugPresenterTests: XCTestCase {

    var sut: DrugPresenter!
    var viewSpy: DrugViewSpy!

    override func setUp() {
        super.setUp()
        viewSpy = DrugViewSpy()
        sut = DrugPresenter(view: viewSpy, drugs: [])
    }

    override func tearDown() {
        sut = nil
        viewSpy = nil
        super.tearDown()
    }

    func testShowCalling() {
        sut.viewDidLoad()
        XCTAssertTrue(viewSpy.showCalled)
    }
    
}

class DrugViewSpy: DrugView {

    var showCalled = false

    func showDrugs(drugs: [Drug]) {
        showCalled = true
    }

}
