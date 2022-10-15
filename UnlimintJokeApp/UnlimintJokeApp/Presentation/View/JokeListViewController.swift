//
//  JokeViewController.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import UIKit
import RxSwift
import RxCocoa

class JokeListViewController: UIViewController {
    
    var tableView = UITableView()
    var jokeListViewModel = JokeListViewModel()
    var dataSource:[Joke] = []
    private var bag = DisposeBag()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        jokeListViewModel = JokeListViewModel()
        
        // Setting up table view
        setupTableView()
        bindTableData()
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
        
    }
    
    func bindTableData() {
        
        // bind item to table
        jokeListViewModel.items.bind(to: tableView.rx.items(
            cellIdentifier: UNJConstans.jokeViewCellIdentifier,
            cellType: JokeTableViewCell.self)) {
                row, model, cell in
                
                cell.joke = model
            } .disposed(by: bag)
        
        // bind item selected handler
        tableView.rx.modelSelected(Joke.self).bind { joke in
            print(joke.joke)
        }.disposed(by: bag)
        
        // fetch Items
        jokeListViewModel.scheduleTimer.startNotifier()
        
        
        // adding animation
        tableView.rx.willDisplayCell
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { (cell, indexPath) in
                
                if indexPath.row == 0 {
                    
                    cell.alpha = 0
                    let transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
                    cell.transform = transform
                    
                    UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options:  .curveEaseInOut, animations: {
                        cell.alpha = 1
                        cell.layer.transform = CATransform3DIdentity
                    }, completion: nil)
                }
            })
            .disposed(by: bag)
    }
}

extension JokeListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80.0
    }
}


