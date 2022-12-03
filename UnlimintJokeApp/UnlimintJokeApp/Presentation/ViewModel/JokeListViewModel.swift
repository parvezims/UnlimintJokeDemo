//
//  JokeListViewModel.swift
//  UnlimintJokeApp
//
//  Created by Muzaffar on 09/10/22.
//

import Foundation
import Combine

enum Output {
  case fetchQuoteDidFail(error: Error)
  case fetchQuoteDidSucceed(jokes: [Joke])
}

class JokeListViewModel {
    
    init() {
        self.scheduleTimer = ScheduleToFetchAPI()
        NotificationCenter.default.addObserver(self, selector: #selector(getJokes), name: NSNotification.Name.contentFechedFinished, object: nil)
    }
    
    var scheduleTimer:ScheduleToFetchAPI
    var jokes = [Joke]()
    var items: AnyPublisher<[Joke], Error>
    
    private let output: PassthroughSubject<Output, Never> = .init()
    private var cancellables = AnyCancellable.self


    @objc func getJokes(notification: Notification){
        
        if let object = notification.object {
            let jokesArr = object as! [Joke]
            self.jokes = jokesArr
            
            
           
            
            
            cancellables = items.sink { [weak self] completion in
                
              if case .failure(let error) = completion {
                self?.output.send(.fetchQuoteDidFail(error: error))
              }
            } receiveValue: { [weak self] quote in
                
              self?.output.send(.fetchQuoteDidSucceed(quote: self.jokes))
                
            }.store(in: &cancellables)

            
            
            NotificationCenter.default.post(name:Notification.Name.realodTableview , object: self.jokes)
        }
    }
    
    deinit {
        self.scheduleTimer.timer?.invalidate()
        NotificationCenter.default.removeObserver(Notification.Name.contentFechedFinished)
    }
}
