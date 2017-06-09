var promise = require('bluebird');

var options = {
  // Initialization Options
  promiseLib: promise
};

var pgp = require('pg-promise')(options);
var connectionString = 'postgres://postgres:asdfg@localhost:5432/RssFeeds';
var db = pgp(connectionString);

function getAllFeeds(req, res, next) {
  db.any('select * from feeds')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ALL feeds'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

function getSingleFeed(req, res, next) {
  var feedID = parseInt(req.params.id);
  db.one('select * from feeds where id = $1', feedID)
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ONE feed'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

function createFeed(req, res, next) {
  	//console.log(req.body.feedObject);
	
	var feedObject = req.body.feedObject;
	
	//console.log("Work",feedObject);
	
	
	var feedObj = JSON.parse(feedObject); 
	
	//console.log(Obj);
	
	for(var i=0;i<feedObj.length;i++)
	{
	var feed = feedObj[i];
	db.none('insert into feeds(feed_title, feed_link, feed_description)' +
      'values(${title}, ${link}, ${description})',
		  {
			  title: feed.title,
			  link: feed.link,
			  description: feed.description
		  })
    .then(function () {
      /*res.status(200)
        .json({
          status: 'success',
          message: 'Inserted one feed'
        });*/
		console.log('success');
	
    })
    .catch(function (err) {
      return next(err);
    });
	
	}
    
}

function updateFeed(req, res, next) {
  db.none('update feeds set title=$1, link=$2, description=$3 where id=$4',
    [req.body.title, req.body.link, req.body.description, parseInt(req.params.id)])
    .then(function () {
      res.status(200)
        .json({
          status: 'success',
          message: 'Updated feed'
        });
    })
    .catch(function (err) {
      return next(err);
    });
}

function removeFeed(req, res, next) {
  var feedID = parseInt(req.params.id);
  db.result('delete from feeds where id = $1', feedID)
    .then(function (result) {
      /* jshint ignore:start */
      res.status(200)
        .json({
          status: 'success',
          message: `Removed ${result.rowCount} feed`
        });
      /* jshint ignore:end */
    })
    .catch(function (err) {
      return next(err);
    });
}


module.exports = {
  getAllFeeds: getAllFeeds,
  getSingleFeed: getSingleFeed,
  createFeed: createFeed,
  updateFeed: updateFeed,
  removeFeed: removeFeed
};