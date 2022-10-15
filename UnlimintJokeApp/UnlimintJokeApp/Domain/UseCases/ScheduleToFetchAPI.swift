//
//  ScheduleToFetchAPI.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 13/10/22.
//

import Foundation


class ScheduleToFetchAPI {
    
    var timer:Timer?
    private let fetchJokeUseCase = DefaultFetchJokeUseCases()
    let jokeDataManager = JokeDataManager()
    init() {}
    
    func startNotifier() {
        checkAndLoadExistingData()
        scheduleATimer()
    }
    
    func checkAndLoadExistingData() {
        
        if let oldData = jokeDataManager.getExistingData() {
            NotificationCenter.default.post(name:Notification.Name.contentFechedFinished , object:oldData)
            
            if oldData.count == 0 {
                self.getJokes()
            }
        }
    }
    func scheduleATimer() {
        
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(Constant.intervalTiming),
                                          target: self,
                                          selector: #selector(getJokes),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc func getJokes() {
        
        fetchJokeUseCase.execute(objectType: Joke.self) { [weak self] joke in
            if let weakself = self {
                
                var joke = joke
                joke.date = Date()
                joke.id = UUID()
                weakself.jokeDataManager.createJoke(joke: joke)
                weakself.jokeDataManager.deleteIfRequired()
                NotificationCenter.default.post(name:Notification.Name.contentFechedFinished , object: weakself.jokeDataManager.jokes)
            }
        }
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
}
