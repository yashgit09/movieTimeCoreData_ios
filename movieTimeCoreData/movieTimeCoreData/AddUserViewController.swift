//
//  AddUserViewController.swift
//  movieTimeCoreData
//
//  Created by user221908 on 8/8/22.
//

import UIKit
import CoreData

class AddUserViewController: UIViewController {
    
    var persistentContainer: NSPersistentContainer!
    var users: [Users]!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        guard
            let name = userName.text
        else{
             preconditionFailure("No name was found")
            }
        
        let moc = persistentContainer.viewContext
        
        moc.perform {
            let user = Users(context: moc)
           user.name = name
            
            do{
                try moc.save()
                self.users.append(user)
            }catch{
                moc.rollback()
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
