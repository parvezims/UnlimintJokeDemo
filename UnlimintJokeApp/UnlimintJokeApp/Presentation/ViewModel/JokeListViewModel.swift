//
//  JokeListViewModel.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import Foundation

class JokeListViewModel {
    
    init() {
        self.scheduleTimer = ScheduleToFetchAPI()
        NotificationCenter.default.addObserver(self, selector: #selector(getJokes), name: NSNotification.Name.contentFechedFinished, object: nil)
    }
    
    var scheduleTimer:ScheduleToFetchAPI
    var jokes = [Joke]()

    @objc func getJokes(notification: Notification){
        
        if let object = notification.object {
            let jokesArr = object as! [Joke]
            self.jokes = jokesArr
            NotificationCenter.default.post(name:Notification.Name.realodTableview , object: self.jokes)
        }
    }
    
    deinit {
        self.scheduleTimer.timer?.invalidate()
        NotificationCenter.default.removeObserver(Notification.Name.contentFechedFinished)
    }
}
