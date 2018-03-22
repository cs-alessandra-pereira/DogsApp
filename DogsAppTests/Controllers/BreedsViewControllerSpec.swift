//
//  BreedsViewController.swift
//  DogsAppTests
//
//  Created by alessandra.l.pereira on 20/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

@testable import DogsApp
import Quick
import Nimble

class BreedsViewControllerSpec: QuickSpec {
    
    override func spec() {
        describe("BreedsViewController") {
            
            let sut = BreedsViewControllerStub.init(nibName: nil, bundle: nil)
            
            context("when it loads", closure: {
                
                beforeEach {
                    sut.beginAppearanceTransition(true, animated: false)
                    sut.endAppearanceTransition()
                }
                
                it("should call the setupSearchBar", closure: {
                    expect(sut.isSetupSearchBarCalled).to(beTrue())
                })
                
                it("should call fetchBreeds", closure: {
                    expect(sut.isFetchBreedsCalled).to(beTrue())
                })
                it("should set the navigation tittle", closure: {
                    expect(sut.navigationItem.title).toNot(beNil())
                })
                
            })
            
            context("when fetchBreeds is called", closure: {
                
            })
            
        }
    }
}
