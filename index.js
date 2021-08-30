// the program creates updates and provide views of suppliers to a company in six branches distributed in uasin gidhu subcounties

const express = require('express');
const mysql = require('mysql');
const bodyparser = require('body-parser');
var app = express();

app.use(bodyparser.json());

var PORT = 3000;

var connection = mysql.createConnection({
  host : 'localhost',
  user : 'byron',
  password : '1234',
  database : 'wakulima',
  multiplestatements : true
});

connection.connect((err)=> {
  if (err) {
    console.error('error connecting to the database: ' + err.stack);
    return;
  }

  console.log('database connection is a success ' + connection.threadId);
});


app.listen(PORT, () => console.log(`Express server is running at port: ${PORT}` ));


// displaying all supplies
app.get('/suppliers', (req,res)=>{
    connection.query('SELECT * FROM `supplies` ', (err, results, fields)=> {
      if (err) {
        console.error('error connecting to the database: ' + err.stack);
        return;
      }

      res.send(results);
      console.log(results);

    });
})





// displaying branch supplies
app.get('/branch/:sub_county', (req,res)=>{
    connection.query(`SELECT * FROM supplies WHERE sub_county  = "${req.params.sub_county}"`, (err, results, fields)=> {
      if (err) {
        console.error('error connecting to the database: ' + err.stack);
        return;
      }
      res.send(results);
      console.log(results);

    });
})



// deleting an entry in supplies i have deleted id=2
app.get('/delete/:id', (req,res)=>{
    connection.query(`DELETE FROM supplies WHERE id  = ${req.params.id}`, (err, results, fields)=> {
      if (err) {
        console.error('error connecting to the database: ' + err.stack);
        return;
      }
      res.send("deletion was succesful");
      console.log("deletion was succesful");

    });
})



// inserting an entry into supplies where id=2
app.get('/insert', (req,res)=>{
    var suppliy = {sub_county:'moiben', manager:'kipkesoi', supplier:'john kinyua', quantity: 15, date_supplied:'2021-08-14', amount_owned:170040 }
    var sql = "INSERT INTO supplies SET ?";

    connection.query(sql, suppliy, (err, results, fields)=> {
      if (err) {
        console.error('error connecting to the database: ' + err.stack);
        return;
      }

      res.send("entry was added succesfuly \n" + results );
      console.log("entry was added succesfuly \n" +results);

    });
})



// updating supplier, quantity, date_supplied and amount in supplies
app.get('/update/:id', (req,res)=>{
    var newval = {supplier:'ben haudrey', quantity:4, date_supplied:'2021-02-30', amount_owned:45500};
    var sql = `UPDATE supplies SET ? WHERE id = ${req.params.id}`
    connection.query(sql, newval, (err, results, fields)=> {
      if (err) {
        console.error('error connecting to the database: ' + err.stack);
        return;
      }
      res.send("the update was succesful" + results);
      console.log("the update was succesful" + results);

    });
})
