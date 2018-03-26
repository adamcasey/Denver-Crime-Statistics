var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'aMAZEing Games' });
});

router.post('/register', function(req, res, next) {
	const Username = req.body.username;
	const Useremail = req.body.email;
	const Userpassword = req.body.password;
	var randomnumber=Math.floor(Math.random()*11)

	console.log(Username);
	console.log(Useremail);
	console.log(Userpassword);

	//This is what actually connects us to the db
	const db = require('../db.js')
	//Access databse object and call a query on it
	//This should actually insert a new user into the db
	db.query('INSERT INTO users (Username, Useremail, Userpassword) VALUES (?, ?, ?)', [Username, Useremail, Userpassword],
		function(error, results, fields) {
			if (error) throw error;

			//res.render('register', { title: 'Registration Complete!' });
		});
	res.render('index', { title: 'Registration Complete!' });
});
module.exports = router;


