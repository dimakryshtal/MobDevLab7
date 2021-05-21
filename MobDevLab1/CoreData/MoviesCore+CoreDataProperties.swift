//
//  MoviesCore+CoreDataProperties.swift
//  MobDevLab1
//
//  Created by Dima on 20.05.2021.
//
//

import Foundation
import CoreData


extension MoviesCore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesCore> {
        return NSFetchRequest<MoviesCore>(entityName: "MoviesCore")
    }

    @NSManaged public var imdbID: String?
    @NSManaged public var poster: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var year: String?
    @NSManaged public var details: Details?

}

extension MoviesCore : Identifiable {

}
