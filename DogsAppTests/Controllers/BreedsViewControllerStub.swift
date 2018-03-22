//
//  BreedsViewControllerStub.swift
//  DogsAppTests
//
//  Created by alessandra.l.pereira on 20/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

@testable import DogsApp

class BreedsViewControllerStub: BreedsViewController {
    
    var isSetupSearchBarCalled = false
    var isFetchBreedsCalled = false
    
    override func setupSearchBar() {
        isSetupSearchBarCalled = true
    }
    
    override func fetchBreeds() {
        isFetchBreedsCalled = true
    }
}
