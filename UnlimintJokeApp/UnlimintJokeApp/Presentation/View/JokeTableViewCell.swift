//
//  JokeTableViewCell.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 13/10/22.
//

import Foundation
import UIKit

class JokeTableViewCell: UITableViewCell {
    
    var joke:Joke? {
        didSet {
            guard let jokeItem = joke else {return}
            jokeLabel.text = jokeItem.joke
            dateLabel.text = jokeItem.date?.convertLocalDate()
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: UNJConstans.unlimintThemeColor)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let jokeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor =  .gray
        label.textAlignment = .left
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(jokeLabel)
        self.contentView.addSubview(dateLabel)
        self.backgroundColor = .black
        
        containerView.leftAnchor.constraint(equalTo:self.contentView.leftAnchor, constant:5).isActive = true
        containerView.rightAnchor.constraint(equalTo:self.contentView.rightAnchor, constant:-5).isActive = true
        containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:2).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant:-2).isActive = true

        
        jokeLabel.leftAnchor.constraint(equalTo:self.containerView.leftAnchor, constant:8).isActive = true
        jokeLabel.rightAnchor.constraint(equalTo:self.containerView.rightAnchor, constant:-8).isActive = true
        jokeLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor, constant:5).isActive = true
        
        dateLabel.leftAnchor.constraint(equalTo:self.jokeLabel.leftAnchor).isActive = true
        dateLabel.rightAnchor.constraint(equalTo:self.jokeLabel.rightAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo:self.jokeLabel.bottomAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor, constant:-5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
