//
//  Favourites+CoreDataProperties.swift
//  News
//
//  Created by Vikhyath on 04/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//
//

import Foundation
import CoreData


extension Favourites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourites> {
        return NSFetchRequest<Favourites>(entityName: "Favourites")
    }


}
