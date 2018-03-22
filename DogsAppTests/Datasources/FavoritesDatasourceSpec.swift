//
//  FavoritesDatasourceSpec.swift
//  DogsAppTests
//
//  Created by alessandra.l.pereira on 19/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

@testable import DogsApp
import Quick
import Nimble

class FavoritesDatasourceSpec: QuickSpec {
    
    override func spec() {
        
        var tableView: UITableView!
        var indexPath: IndexPath!
        var sammy: Breed!
        var duke: Dog!
        var garrel: Dog!
        var dogs: [Dog]!
        var sut: FavoritesDatasource!
        
        describe("FavoriteDatasource") {
            
            //Roda uma vez só
            beforeSuite {
                tableView = UITableView(frame: .zero)
                indexPath = IndexPath(row: 0, section: 0)
                sammy = Breed(name: "Samoyed")
                duke = Dog(breed: sammy, image: "")
                garrel = Dog(breed: sammy, image: "")
                dogs = [duke, garrel]
                sut = FavoritesDatasource.init(tableView: tableView, dogs: dogs)
            }
            
            context("when it's initialized", closure: {
                
                var sut: FavoritesDatasourceStub!
                
                //Roda uma vez para cada teste
                beforeEach {
                    sut = FavoritesDatasourceStub(tableView: tableView, dogs: dogs)
                }
                
                it("should store the given dogs array", closure: {
                    expect(sut).toNot(beNil())
                })
                it("should call the register for tableview", closure: {
                    expect(sut.isRegisterCalled).to(beTrue())
                })
                
            })
            
            context("responding to UITableViewDatasource", closure: {
                
                context("when numberOfRows is called", closure: {
                    
                    it("should return the dogs array size", closure: {
                        
                        let rows = sut.tableView(tableView, numberOfRowsInSection: 0)
                        expect(rows).to(equal(dogs.count))

                    })
                    
                })
                
                context("when cellForRowAt is called", closure: {
                    
                    it("should return a valid cell", closure: {
                        
                        let cell = sut.tableView(tableView, cellForRowAt: indexPath) as? FavoriteDogTableViewCell
                        expect(cell).to(beAKindOf(FavoriteDogTableViewCell.self))
                        
                    })
       
                    it("should return the breed label text as the same as input", closure: {
                        
                        let cell = sut.tableView(tableView, cellForRowAt: indexPath) as? FavoriteDogTableViewCell
                        cell?.setup(dog: duke)
                        expect(cell?.breed.text).to(equal(sammy.name))
                        
                    })
                    
                })
                
            })
            
        }
        
    }

}

