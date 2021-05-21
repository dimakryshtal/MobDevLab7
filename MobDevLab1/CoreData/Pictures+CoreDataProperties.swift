//
//  Pictures+CoreDataProperties.swift
//  MobDevLab1
//
//  Created by Dima on 20.05.2021.
//
//

import Foundation
import CoreData


extension Pictures {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pictures> {
        return NSFetchRequest<Pictures>(entityName: "Pictures")
    }

    @NSManaged public var cover: Data?
    @NSManaged public var title: String?

}

extension Pictures : Identifiable {

}
