var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017";

MongoClient.connect(url,function(err,db){
    if(err) throw err;
    var dbo = db.db("mydb");
    var myobj = [
        {name:'John',address:'Highway 71'},
        {name:'Peter',address:'Lowstreet 4'},
        {name:'Amy',address:'Apple st 652'},
        {name:'Hannah',address:'Mountain 21'},
        {name:'Micheal',address:'Valley 21'},
        {name:'Sandy',address:'Ocean blvd 2'},
        {name:'Betty', address:'Green Grass 1'},
        {name:'Richard', address:'Sky st 331'},
        {name:'Susan', address:'One wat 98'},
        {name:'Vicky', address:'Yellow Garden 2'},
        {name:'Ben', address:'Park Lane 38'},
        {name:'William', address:'Central st 954'},
        {name:'chuck', address:'Main Road 989'},
        {name:'Viola', address:'Sideway 1633'}
    ];
    dbo.collection("customers").insertMany(myobj, function (err,res) {
        if(err) throw err;
        console.log("Number of documners inserted: "+res.insertedCount);
        db.close();     
    });
});