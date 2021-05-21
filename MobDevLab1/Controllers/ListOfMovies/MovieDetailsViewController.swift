//
//  MovieDetailsViewController.swift
//  MobDevLab1
//
//  Created by Dima on 25.02.2021.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var details: Details?

    @IBOutlet var poster: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var genre: UILabel!
    @IBOutlet var year: UILabel!
    @IBOutlet var director: UILabel!
    @IBOutlet var actors: UILabel!
    
    @IBOutlet var country: UILabel!
    @IBOutlet var language: UILabel!
    @IBOutlet var production: UILabel!
    @IBOutlet var released: UILabel!
    @IBOutlet var runtime: UILabel!
    @IBOutlet var awards: UILabel!
    @IBOutlet var rating: UILabel!
    @IBOutlet var plot: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setImageAndLabels()
    }
    
    func setImageAndLabels() {
        let child = SpinnerViewController()
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
       
        Manager.shared.fetchData(with: "Pictures", searchStr: details!.poster!, attribute: "title", ofType: Pictures.self) {[weak self] (pict, error) in
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
            if(pict.count > 0) {
                self?.poster.image = UIImage(data: pict[0].cover!)
            } else {
                NetworkManager.sharad.getImage(with: self!.details!.poster!) {[weak self] (cover, error) in
                    self?.poster.image = cover
                }
            }
        }
        
        movieTitle.text = "Title: " + details!.title!
        year.text = "Year: " + details!.year!
        genre.text = "Genre: " + details!.genre!
        director.text = "Director: " + details!.director!
        actors.text = "Actors: " + details!.actors!
        country.text = "Country: " + details!.country!
        language.text = "Language: " + details!.language!
        production.text = "Production: " + details!.production!
        released.text = "Released: " + details!.released!
        runtime.text = "Runtime: " + details!.runtime!
        awards.text = "Awards: " + details!.awards!
        rating.text = "Rating: " + details!.rated!
        plot.text = "Plot: " + details!.plot!
    }
}
