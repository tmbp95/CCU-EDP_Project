'use strict';

module.exports = function(Customers) {

	Customers.username = function(customer_name ,cb){
		Customers.find({where: {customer_name: customer_name}}, function (err, instance){
			var response = instance;
			cb(null, response);
        	console.log(response);
		})
	}

	Customers.remoteMethod (
		'username' ,
		{
			http: {path: '/username', verb: 'get'},
			accepts: {arg: 'customer_name', type: 'string', http: {source: 'query'}},
			returns: [
			{arg: 'customer_id', type: 'number'},
			{arg: 'login', type: 'string'},
			{arg: 'password', type: 'string'},
			{arg: 'email', type: 'string'},
			{arg: 'customer_name', type: 'string'},
			{arg: 'customer_address', type: 'string'},
			{arg: 'creditcard', type: 'string'},
			{arg: 'lastlogin', type: 'date'}
			]
		}
	);

	// Customers.transactions = function(customer_id, cb){
	// 	var filter = { include : [ 'transactions'] };
	// 	Customers.findById(customer_id, filter, function(err, instance) {
	// 		if(err) {
 //        console.log(err);
	// 	} else {
	// 		var capp = Customers.app;
	// 		var t = capp.models.Transactions;
	// 		t.find({where: {client_id: customer_id}}, function(err, trans){
	// 			if(err) {
	// 				console.log(err);
	// 			}
	// 			else {
	// 				var response = trans;
	// 				cb(null, response);
 //        			console.log(response);
	// 			}
	// 		});
	// 	}
	// 	});
	// }

	// Customers.remoteMethod(
	// 	'transactions',
	// 	{
	// 		http: {path: '/transactions', verb: 'get'},
	// 		accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
	// 		returns: [
	// 		{arg: 'transaction_id', type: 'number'},
	// 		{arg: 'client_id', type: 'number'},
	// 		{arg: 'energy_id', type: 'number'},
	// 		{arg: 'production', type: 'string'},
	// 		{arg: 'transaction_time', type: 'date'}
	// 		]
	// 	}
	// 	);

};
