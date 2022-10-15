
  
/Users/muzaffar/Desktop/unlimint-website-preview.png


# Readme

This Demo is for Unlimin. MVVM and Clean architecture approach. 
Used Rxswift for Reactive using Swift Package Manager

## Topics

### Presentation : Used MVVM 

JokeListViewController View : Home View
JokeTableViewCell View : Home View Cell 
JokeListViewModel ViewModel: View Model for Home page

### Domain 

Use Cases -> FetchJokeUseCases, ScheduleToFetchAPI and JokeDataManager : These are responsible for data and Timer
Entites -> Joke : Model
Constants ->  NotificationConstants and Constants : Some constants added

### Infrastructure : 
NetworkService: This is used for fetching data from api.

### Data 
Netwrok -> APIEndpoints
PersistentStorage -> CoreDataStorage : Core data model main class.
JokeCDM -> JokeCDMRepositoryFile, JokeCDMManager, JokeCDM+CoreDataClass, JokeCDM+CoreDataProperties

### Utility 
Constants -> UNJConstants  : some string constants added
Extension -> Date+Extension : added convert date to string 

### Resources
Assets: assets are here, images, app icons, theme colors. 
LaunchScreen: is used for launch screen
UnlimintJokeApp: coredatamodel 
