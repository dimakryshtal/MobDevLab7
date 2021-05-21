//
//  Manager.swift
//  MobDevLab1
//
//  Created by Dima on 26.02.2021.
//

import Foundation
import UIKit
import CoreData

final class Manager {
    static let shared = Manager()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}
extension Manager {
    public func parseJSON<T>(data: Data, type: T.Type) -> T? where T : Decodable {
        let text = String(decoding: data, as: UTF8.self)
        let jsonData = text.data(using: .utf8)!
        
        do {
            let json = try JSONDecoder().decode(type.self, from: jsonData)
            return json
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    public func getText<T>(_ textName: String, type: T.Type) -> T? where T : Decodable{
        if let filePath = Bundle.main.path(forResource: textName, ofType: "txt") {
            do {
                let text = try String(contentsOfFile: filePath)
                let jsonData = text.data(using: .utf8)!
                let json = try! JSONDecoder().decode(type.self, from: jsonData)
                return json
            } catch {
                print("No such file")
            }
        }
        return nil
    }
    public func getImage (_ fileName: NSString) -> UIImage?{
        let name = fileName.deletingPathExtension
        let type = fileName.pathExtension
        if let path = Bundle.main.path(forResource: name, ofType: type) {
            return UIImage(contentsOfFile: path)
        } else {
            return nil
        }
    }
}

extension Manager {
    func getMovies(completion: @escaping ([MoviesCore], Error?) -> Void) {
        do {
            let items = try context.fetch(MoviesCore.fetchRequest()) as! [MoviesCore]
            completion(items, nil)
        }
        catch {
        }
    }
    
    func fetchData<T>(with entity: String, searchStr: String, attribute: String, ofType: T.Type, completion: @escaping ([T], Error?) -> Void) where T: NSFetchRequestResult {
        let request = NSFetchRequest<T>(entityName: entity)
        request.predicate = NSPredicate(format: "\(attribute) CONTAINS[c] %@", searchStr)
        
        do {
            let fetchedResult = try context.fetch(request)
            completion(fetchedResult, nil)
        }
        catch {}
    }
    
    func addItems(_ arrOfMovies: [Movie]) {
        for i in arrOfMovies {
            let newItem = MoviesCore(context: context)
            newItem.title = i.title
            newItem.imdbID = i.imdbID
            newItem.type = i.type
            newItem.year = i.year
            newItem.poster = i.poster
            
            do {
                try context.save()
            }
            catch{}
        }
    }
    func addPicture(data: Data, link: String) {
        let newPicture = Pictures(context: context)
        newPicture.title = link
        newPicture.cover = data
        do {
            try context.save()
        }
        catch{
            print("\(error)")
        }
    }
    func addDetails(_ movie: Movie) {
        let newItem = Details(context: context)
        newItem.actors = movie.actors
        newItem.awards = movie.awards
        newItem.country = movie.country
        newItem.director = movie.director
        newItem.genre = movie.genre
        newItem.imdbID = movie.imdbID
        newItem.imdbRating = movie.imdbRating
        newItem.imdbVotes = movie.imdbVotes
        newItem.language = movie.language
        newItem.plot = movie.plot
        newItem.poster = movie.poster
        newItem.production = movie.production
        newItem.rated = movie.rated
        newItem.released = movie.released
        newItem.runtime = movie.runtime
        newItem.title = movie.title
        newItem.type = movie.type
        newItem.writer = movie.writer
        newItem.year = movie.year
        do {
            try context.save()
        }
        catch{
            print("\(error)")
        }
        
    }
}


