# FeedReader

An Rss Reader app with persistent storage

# Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
* [Node.js](http://nodejs.org)
* [PostgreSQL](https://www.postgresql.org/)
* [AndroidStudio] (https://developer.android.com/studio/index.html)

### Installing

##### Clone the repository
```bash
$ git clone https://github.com/mendoncagary/FeedReader.git
$ cd FeedReader
```

##### Start the NodeJS Server
```bash
$ cd RssServer
$ npm install
$ npm start
```

##### Import the database
```bash
$ cd database
$ pg_restore -U $username --dbname=RssFeeds RssFeeds.sql
```

##### Make necessary changes
* Change the PostgreSQL variable connectionString to your appropriate username and password in FeedReader/RssServer/queries.js
* Change the url variable inside SendPostRequest function in MainActivity.java to your appropriate host address.
(URL url = new URL("http://192.168.0.105:3000/api/feeds");)
* Change the url variable in SavedFeedsActivity to your appropriate host address.
(private static String url = "http://192.168.0.105:3000/api/feeds/";)

#### Finally build the app and install 

#### The apk file is located in FeedReader/app/build/outputs/apk/

# ScreenShots
![Home Screen Image](/images/fetchFeeds1.png "Home Screen")
![Home Screen Image](/images/fetchFeeds2.png "Home Screen")
![Home Screen Image](/images/fetchFeeds3.png "Home Screen")
![Browser Image](/images/browser.PNG "Browser")
![Saved Feeds Image](/images/savedFeeds.png "Saved Feeds page")
