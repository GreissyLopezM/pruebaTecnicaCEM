//
//  HomeViewController.swift
//  pruebaTecnica
//
//  Created by Loducode Retina on 18/02/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var userList: UITableView!
    
    var arrayUser = [userResponse]()
    
    var userModel: usersProtocols?

    override func viewDidLoad() {
        setupModel()
        super.viewDidLoad()
        userList.dataSource = self
        userList.delegate = self
        userList.register(UINib(nibName: "usersTableViewCell", bundle: nil), forCellReuseIdentifier: "usersTableViewCell")
    }
    

    fileprivate func setupModel() {
        if userModel == nil {
            setModel(pruebaTecnica.userModel())
        }
    }
    func setModel(_ Model: usersProtocols){
        userModel = Model
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersTableViewCell", for: indexPath)
        
        if let cell = cell as? usersTableViewCell {
            cell.setupCell(user: self.arrayUser[indexPath.row])
        }
        return cell
    }
}
