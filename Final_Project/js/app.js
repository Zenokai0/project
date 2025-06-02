//connect to mysql and req
const http = require('http');
const mysql = require('mysql2')
const url = require('url');

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '010477148',
    database: 'zando'
});

con.connect((err) => {
    if (err) throw err;
    console.log('Connected');
});

const server = http.createServer((req, res) => {

    //allow cors
    res.setHeader('Access-Control-Allow-Origin', '*')

    //for men
    if(req.url.match(/^\/men\/([^\/]+)$/)){
        const subcategory = req.url.match(/^\/men\/([^\/]+)$/)[1]; //get the second first capture group '/men/shoes' [1] will return shoes

        con.query(`select * from products where category = 'men' and subcategory = '${subcategory}'`, (err, result, fields) => {
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify(result));
            })
    } 
    //for women
    else if(req.url.match(/^\/women\/([^\/]+)$/)){
        const subcategory = req.url.match(/^\/women\/([^\/]+)$/)[1];
        con.query(`select * from products where category = 'women' and subcategory = '${subcategory}'`, (err, result, fields) => {
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify(result));
            });
    } 
    //for accessories
    else if(req.url.match(/^\/accessories\/([^\/]+)$/)){
        const subcategory = req.url.match(/^\/accessories\/([^\/]+)$/)[1];
        con.query(`select * from products where category = 'accessories' and subcategory = '${subcategory}'`, (err, result, fields) => {
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify(result));
            })
    }

    //get item details
    if(req.url.match(/^\/get-details\/([^\/]+)$/)){
        const product_id = req.url.match(/^\/get-details\/([^\/]+)$/)[1];
        con.query(`select product_name, price, product_images, size, color from products join products_details using(product_id) where product_id = '${product_id}'`, (err, result, fields) => {
                res.setHeader('Content-Type', 'application/json');
                res.end(JSON.stringify(result));
            })
    }
});

server.listen(3000);