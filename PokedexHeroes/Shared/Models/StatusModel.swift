//
//  StatusModel.swift
//  PokedexHeroes
//
//  Created by Mikel Cobian on 6/3/22.
//

import Foundation

enum Status {
    case none,
         loading,
         loaded,
         register,
         error(error:String)
}
