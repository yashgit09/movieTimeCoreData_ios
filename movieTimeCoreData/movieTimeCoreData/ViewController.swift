//
//  ViewController.swift
//  movieTimeCoreData
//
//  Created by user221908 on 8/5/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var persistentContainer: NSPersistentContainer!
    var movies: [Movie]!
    
    @IBOutlet weak var movieTitle: UITextField!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let moc = persistentContainer.viewContext
        
        moc.performAndWait {
            let movie = Movie(context: moc)
           movie.title = self.movieTitle.text
            
            do{
                try moc.save()
                self.movies.append(movie)
            }catch{
                moc.rollback()
            }
        }
    }

}

