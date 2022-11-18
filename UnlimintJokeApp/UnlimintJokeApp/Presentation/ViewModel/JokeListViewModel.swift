//
//  JokeListViewModel.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import Foundation
//import RxCocoa
//import RxSwift
import Combine

class JokeListViewModel {
    
    init() {
        self.scheduleTimer = ScheduleToFetchAPI()
        NotificationCenter.default.addObserver(self, selector: #selector(getJokes), name: NSNotification.Name.contentFechedFinished, object: nil)
    }
    
    var scheduleTimer:ScheduleToFetchAPI
    var jokes = [Joke]()
    //var items = PublishSubject<[Joke]>()
    var items = [Joke]()

    @objc func getJokes(notification: Notification){
        
        if let object = notification.object {
            let jokesArr = object as! [Joke]
            //self.items.onNext(jokesArr)
            self.items = jokesArr
            self.jokes = jokesArr
            
            NotificationCenter.default.post(name:Notification.Name.contentFechedFinished , object: self.jokes)

            
//            self.items = Future { promise in
//                promise(.success(jokesArr))
//            }
        }
    }
    
    deinit {
        self.scheduleTimer.timer?.invalidate()
    }
}
