//
//  JokeViewController.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import UIKit

class JokeListViewController: UIViewController {
    
    var tableView = UITableView()
    var jokeListViewModel = JokeListViewModel()
    var dataSource:[Joke] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeListViewModel = JokeListViewModel()
        setupTableView()
    }
    
    func setupTableView() {
        
        // Register Tableview Cell
        tableView.register(JokeTableViewCell.self, forCellReuseIdentifier: UNJConstans.jokeViewCellIdentifier)
        // Adding tableview to view
        view.addSubview(tableView)        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
        tableView.frame = UIScreen().bounds
        tableView.backgroundColor = .black
        
        // Setting up delegates
        tableView.delegate = self
        tableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReloadTable), name: NSNotification.Name.realodTableview, object: nil)
        
        jokeListViewModel.scheduleTimer.startNotifier()

    }
    
    @objc func notificationReloadTable(notification: Notification){
        
        if let object = notification.object {
            let jokesArr = object as! [Joke]
            self.dataSource = jokesArr
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(Notification.Name.realodTableview)
    }
}

extension JokeListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            cell.alpha = 0
            let transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
            cell.transform = transform
            
            UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options:  .curveEaseInOut, animations: {
                cell.alpha = 1
                cell.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
    }
}

extension JokeListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UNJConstans.jokeViewCellIdentifier) as! JokeTableViewCell
        let model = dataSource[indexPath.row]
        cell.joke = model
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
}

