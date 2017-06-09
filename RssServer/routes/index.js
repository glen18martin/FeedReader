var express = require('express');
var router = express.Router();
var db = require('../queries');

router.get('/api/feeds', db.getAllFeeds);
router.get('/api/feeds/:id', db.getSingleFeed);
router.post('/api/feeds', db.createFeed);
router.put('/api/feeds/:id', db.updateFeed);
router.delete('/api/feeds/:id', db.removeFeed);


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'RSS Server' });
});

module.exports = router;
