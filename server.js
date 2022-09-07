import express from 'express';
import { people } from './people.js';
import { restaurant } from './restaurant.js';
import { promises as fs } from 'fs';
import path from 'path';
import bodyParser from 'body-parser';

const __dirname = path.resolve();

let app = express();
app.use(bodyParser.json());


app.get('/hello',(req, res)=>{
    res.send("Hello!");
});

app.get('/people',(req, res)=>{
    res.json(people);
});

app.get('/rest',(req, res)=>{
    res.json(restaurant);
})

app.get('/people/:name',(req, res)=>{
    let { name } = req.params;
    let person = people.find(x=> x.name === name);
    res.json(person);
});

app.get('/file-data/', async(req, res)=>{
    let data = await fs.readFile(__dirname + '/src/people-data.json');
    let people = JSON.parse(data);

    res.json(people);
});

app.get('/rest-data/', async(req, res)=>{
    let data = await fs.readFile(__dirname + '/src/restaurant-data.json');
    let restaurant =JSON.parse(data);

    res.json(restaurant);
})

app.post('/people',(req, res)=>{
    let newPerson = req.body;
    people.push(newPerson);

    res.json(people);
});


app.get('/rest',(req, res)=>{
    res.json(restaurant);
})

app.post('/rest',(req,res)=>{
    let newRest = req.body;
    restaurant.push(newRest);

    res.json(restaurant);
})

app.listen(3000,() =>{
    console.log('Server is listening on port 3000');
});