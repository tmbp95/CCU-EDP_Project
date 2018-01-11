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
		e.find({where:{or: [{holder: null}, {holder: 0}]} }, function(err, instance) {
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
			{arg: 'quantity', type: 'number'},
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
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);
	
	Customers.soldPacks = function(customer_id, cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where: {and: [{producer_id: customer_id}, {or:[{not:{holder: customer_id}}, {not:{holder: 0}}]}]}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'soldPacks',
		{
			http: {path: '/soldPacks', verb: 'get'},
			accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

		
	Customers.producedTimeFrame = function(customer_id, begin, end, cb){
		var filter = { include : [ 'producedenergy'] };
		var capp = Customers.app;
		var e = capp.models.Producedenergy;
		e.find({where: {and: [{producer_id: customer_id},{posted_time:{between:[begin,end]}}]}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'producedTimeFrame',
		{
			http: {path: '/producedTimeFrame', verb: 'get'},
			accepts: [
			{arg: 'customer_id', type: 'number', http: {source: 'query'}},
			{arg: 'begin', type: 'date', http: {source: 'query'}},
			{arg: 'end', type: 'date', http: {source: 'query'}}
			],
			returns: [
			{arg: 'producer_id', type: 'number'},
			{arg: 'increment_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'posted_time', type: 'date'},
			]
		}
		);

	Customers.producedEnergy = function(customer_id,cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where: {producer_id: customer_id} }, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'producedEnergy',
		{
			http: {path: '/producedEnergy', verb: 'get'},
			accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enOrderQuantA = function(cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:{or: [{holder: null}, {holder: 0}]} , order: 'quantity ASC'}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enOrderQuantA',
		{
			http: {path: '/enOrderQuantA', verb: 'get'},
			// accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enOrderQuantD = function(cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:{or: [{holder: null}, {holder: 0}]} , order: 'quantity DESC'}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enOrderQuantD',
		{
			http: {path: '/enOrderQuantD', verb: 'get'},
			// accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enOrderKWHA = function(cb){

		var filter = { include : [ 'energy'] };

		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:{or: [{holder: null}, {holder: 0}]} , order: 'KWhPrice ASC'}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enOrderKWHA',
		{
			http: {path: '/enOrderKWHA', verb: 'get'},
			// accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enOrderKWHD = function(cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:{or: [{holder: null}, {holder: 0}]} , order: 'KWhPrice DESC'}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enOrderKWHD',
		{
			http: {path: '/enOrderKWHD', verb: 'get'},
			// accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);


	Customers.enOrderProducer = function(customer_id, cb){
		// var teste = Customers.username(customer_name);
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:{
				and: [
					{ or: [{holder: null}, {holder: 0}] },
					{producer_id: customer_id}
				]}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
			console.log(response.customer_id);
		})
		
	}

	Customers.remoteMethod(
		'enOrderProducer',
		{
			http: {path: '/enOrderProducer', verb: 'get'},
			accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enOrderPriceA = function(cb){

		var filter = { include : [ 'energy'] };

		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:{or: [{holder: null}, {holder: 0}]} , order: 'finalPrice ASC'}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enOrderPriceA',
		{
			http: {path: '/enOrderPriceA', verb: 'get'},
			// accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enOrderPriceD = function(cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:{or: [{holder: null}, {holder: 0}]} , order: 'finalPrice DESC'}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enOrderPriceD',
		{
			http: {path: '/enOrderPriceD', verb: 'get'},
			// accepts: {arg: 'customer_id', type: 'number', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enFilterPrice = function(min, max, cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:
			{and : [ 
				{or: [{holder: null}, {holder: 0}]},
				{finalPrice: {gte: min}},
				{finalPrice: {lte: max}}
			]
			}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enFilterPrice',
		{
			http: {path: '/enFilterPrice', verb: 'get'},
			accepts: [
			{arg: 'min', type: 'number', http: {source: 'query'}},
			{arg: 'max', type: 'number', http: {source: 'query'}}
			],
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enFilterQuant = function(min, max, cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:
			{and : [ 
				{or: [{holder: null}, {holder: 0}]},
				{quantity: {gte: min}},
				{quantity: {lte: max}}
			]
			}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enFilterQuant',
		{
			http: {path: '/enFilterQuant', verb: 'get'},
			accepts: [
			{arg: 'min', type: 'number', http: {source: 'query'}},
			{arg: 'max', type: 'number', http: {source: 'query'}}
			],
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enFilterPackName = function(packName, cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:
			{and : [ 
				{or: [{holder: null}, {holder: 0}]},
				{packName: packName}
			]
			}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enFilterPackName',
		{
			http: {path: '/enFilterPackName', verb: 'get'},
			accepts: {arg: 'packName', type: 'string', http: {source: 'query'}},
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);

	Customers.enFilterAll = function(minP, maxP, minQ, maxQ, producer_id, packName, cb){
		var filter = { include : [ 'energy'] };
		var capp = Customers.app;
		var e = capp.models.Energy;
		e.find({where:
			{and : [ 
				{or: [{holder: null}, {holder: 0}]},
				{finalPrice: {gte: minP}},
				{finalPrice: {lte: maxP}},
				{quantity: {gte: minQ}},
				{quantity: {lte: maxQ}},
				{producer_id: producer_id},
				{packName: packName}
			]
			}}, function(err, instance) {
			var response = instance;
			cb(null, response);
			console.log(response);
		})
		
	}

	Customers.remoteMethod(
		'enFilterAll',
		{
			http: {path: '/enFilterAll', verb: 'get'},
			accepts: [
			{arg: 'minP', type: 'number', http: {source: 'query'}},
			{arg: 'maxP', type: 'number', http: {source: 'query'}},
			{arg: 'minQ', type: 'number', http: {source: 'query'}},
			{arg: 'maxQ', type: 'number', http: {source: 'query'}},
			{arg: 'producer_id', type: 'number', http: {source: 'query'}},
			{arg: 'packName', type: 'string', http: {source: 'query'}}
			],
			returns: [
			{arg: 'energy_id', type: 'number'},
			{arg: 'producer_id', type: 'number'},
			{arg: 'quantity', type: 'number'},
			{arg: 'packName', type: 'string'},
			{arg: 'packDescript', type: 'string'},
			{arg: 'posted_time', type: 'date'},
			{arg: 'holder', type: 'number'}
			]
		}
		);
};
