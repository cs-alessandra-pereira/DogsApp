//
//  FavoriteDatasourceTest.swift
//  DogsAppTests
//
//  Created by alessandra.l.pereira on 22/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

@testable import DogsApp
import XCTest

class FavoritesDatasourceTest: XCTestCase {
    
    var tableView: UITableView!
    var sammy: Breed!
    var duke: Dog!
    var garrel: Dog!
    var dogs: [Dog]!
    var sut: FavoritesDatasource!
    
    override func setUp() {
        //Arrange
        tableView = UITableView(frame: .zero)
        sammy = Breed(name: "Samoyed")
        duke = Dog(breed: sammy, image: "")
        garrel = Dog(breed: sammy, image: "")
        dogs = [duke, garrel]
        sut = FavoritesDatasource(tableView: tableView,
                                  dogs: dogs)
    }
    
    func testInitShouldStoreTheDogsArray(){
        XCTAssertNotNil(sut.dogs)
    }
    
    func testInitShouldCallRegisterToTableView(){
        let sut = FavoritesDatasourceStub(tableView: tableView, dogs: dogs)
        XCTAssertTrue(sut.isRegisterCalled)
    }
    
    func testNumberOfRowsInSectionShouldReturnTheDogsArraySize(){
        //Act
        let rows = sut.tableView(tableView, numberOfRowsInSection: 0)
        //Assert
        XCTAssertTrue(rows == dogs.count)
    }
    
    func testCellForRowShouldReturnAValidCell(){
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView,
                                 cellForRowAt: indexPath) as? FavoriteDogTableViewCell
        XCTAssertNotNil(cell)
    }
    
}

