//
//  Details+CoreDataProperties.swift
//  MobDevLab1
//
//  Created by Dima on 20.05.2021.
//
//

import Foundation
import CoreData


extension Details {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Details> {
        return NSFetchRequest<Details>(entityName: "Details")
    }

    @NSManaged public var actors: String?
    @NSManaged public var awards: String?
    @NSManaged public var country: String?
    @NSManaged public var director: String?
    @NSManaged public var genre: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var imdbRating: String?
    @NSManaged public var imdbVotes: String?
    @NSManaged public var language: String?
    @NSManaged public var plot: String?
    @NSManaged public var poster: String?
    @NSManaged public var production: String?
    @NSManaged public var rated: String?
    @NSManaged public var released: String?
    @NSManaged public var runtime: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var writer: String?
    @NSManaged public var year: String?
  //  @NSManaged public var movies: Movies?

}

extension Details : Identifiable {

}
