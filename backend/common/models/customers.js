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

	Customers.login = function(email, password ,cb){
		Customers.find({where: {and: [{email: email}, {password: password}]} }, function (err, instance){
			var response = instance;
			cb(null, response);
        	console.log(response);
		})
	}

	Customers.remoteMethod (
		'login' ,
		{
			http: {path: '/login', verb: 'get'},
			accepts: [
				{arg: 'email', type: 'string', required: true,http: {source: 'query'}},
				{arg: 'password', type: 'string', required: true , http: {source: 'query'}},
				],
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

	Customers.packsForSale = function(cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where: {holder: null}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'packsForSale',
		{
			http: {path: '/packsForSale', verb: 'get'},
			// accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quatity', type: 'string'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.activePack = function(customer_id, cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where: {and: [{holder: customer_id}, {active : 1}]}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'activePack',
		{
			http: {path: '/activePack', verb: 'get'},
			accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quatity', type: 'string'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

};
