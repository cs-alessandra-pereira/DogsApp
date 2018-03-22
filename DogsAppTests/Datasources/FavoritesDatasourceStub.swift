//
//  FavoritesDatasourceStub.swift
//  DogsAppTests
//
//  Created by alessandra.l.pereira on 19/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

@testable import DogsApp
import UIKit

class FavoritesDatasourceStub: FavoritesDatasource {
    
    var isRegisterCalled = false
    
    override func register(in tableView: UITableView){
        isRegisterCalled = true
    }
    
}
