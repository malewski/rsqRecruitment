//
//  rsqRecruitmentTests.swift
//  rsqRecruitmentTests
//
//  Created by Jan Malewski on 01/10/2019.
//  Copyright © 2019 Jan Malewski. All rights reserved.
//

import XCTest
@testable import rsqRecruitment

class PatientPresenterTests: XCTestCase {

    var sut: PatientPresenter!
    var serviceSpy: PatientServiceSpy!
    var viewSpy: PatientViewSpy!

    override func setUp() {
        super.setUp()
        serviceSpy = PatientServiceSpy()
        viewSpy = PatientViewSpy()
        sut = PatientPresenter(view: viewSpy, service: serviceSpy)
    }

    override func tearDown() {
        sut = nil
        serviceSpy = nil
        viewSpy = nil
        super.tearDown()
    }

    func testDownloadCalling() {
        sut.viewDidLoad()
        XCTAssertTrue(serviceSpy.downloadCalled)
    }

    func testDownloadSuccess() {
        serviceSpy.mockPatient = [PatientData(patient: Patient(age: nil, drugs: []), date: nil),
                                PatientData(patient: Patient(age: "20", drugs: []), date: "20150912")]
        sut.viewDidLoad()
        XCTAssertTrue(viewSpy.displayCalled)
        XCTAssertEqual(viewSpy.testPatient, serviceSpy.mockPatient)
    }

    func testShowDrugs() {
        let drugs = [Drug(name: "Ibuprom"), Drug(name: "Ibum")]
        sut.selectPatient(drugs: drugs)
        XCTAssertEqual(drugs, viewSpy.testDrugs)
    }

}

class PatientServiceSpy: DownloadPatient {

    var downloadCalled = false

    var mockPatient: [PatientData]!

    func download(success: @escaping ([PatientData]?) -> Void, failure: @escaping (Error?) -> Void) {
        downloadCalled = true
        success(mockPatient)
    }

}

class PatientViewSpy: PatientView {

    var displayCalled = false
    var testPatient: [PatientData]!
    var testDrugs: [Drug]!

    func displayPatient(patientList: [PatientData]) {
        displayCalled = true
        testPatient = patientList
    }

    func showDrugs(drugs: [Drug]) {
        testDrugs = drugs
    }

}
