//connect to mysql and req
const http = require('http');
const mysql = require('mysql2')

var con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'zando'
});

con.connect((err) => {
    if (err) throw err;
    console.log('Connected');
});

const server = http.createServer((req, res) => {

    //allow cors
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');


    //for men
    if (req.url.match(/^\/men\/([^\/]+)$/)) {
        const subcategory = req.url.match(/^\/men\/([^\/]+)$/)[1]; //get the second first capture group '/men/shoes' [1] will return shoes

        con.query(`select * from products where category = 'men' and subcategory = '${subcategory}'`, (err, result, fields) => {
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(result));
        })
    }
    //for women
    else if (req.url.match(/^\/women\/([^\/]+)$/)) {
        const subcategory = req.url.match(/^\/women\/([^\/]+)$/)[1];
        con.query(`select * from products where category = 'women' and subcategory = '${subcategory}'`, (err, result, fields) => {
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(result));
        });
    }
    //for accessories
    else if (req.url.match(/^\/accessories\/([^\/]+)$/)) {
        const subcategory = req.url.match(/^\/accessories\/([^\/]+)$/)[1];
        con.query(`select * from products where category = 'accessories' and subcategory = '${subcategory}'`, (err, result, fields) => {
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(result));
        })
    }

    //get item details
    if (req.url.match(/^\/get-details\/([^\/]+)$/)) {
        const product_id = req.url.match(/^\/get-details\/([^\/]+)$/)[1];
        con.query(`select product_name, price, product_images, size, color from products join products_details using(product_id) where product_id = '${product_id}'`, (err, result, fields) => {
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(result));
        })
    }

    if (req.url.match(/^\/get-user-cart\/([^\/]+)$/)) {
        const user_id = req.url.match(/^\/get-user-cart\/([^\/]+)$/)[1];
        con.query(`select user_cart_id, product_id, product_name, price, product_image from products join user_cart using (product_id) where user_id = ${user_id};`, (err, result) => {
            res.setHeader('Content-Type', 'application/json');
            res.end(JSON.stringify(result));
        })
    }

    if (req.method == 'OPTIONS') {
        res.end();
        return;
    }

    if(req.method == 'DELETE'){
        let body = '';
        req.on('data', chunk => {
            body += chunk.toString();
        })
        if(req.url == '/remove-from-cart'){
            req.on('end', () => {
                var data = JSON.parse(body);
                con.query(`delete from user_cart where user_cart_id = ${data.user_cart_id} and product_id = ${data.product_id}`, (err, result) => {
                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify({
                        success: true
                    }));
                })
            })
        }
        if(req.url == '/checkout'){
            req.on('end', () => {
                var data = JSON.parse(body);
                con.query(`delete from user_cart where user_id = ${data.user_id}`, (err, result) => {
                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify({
                        success: true
                    }))
                })
            })
        }
    }

    if (req.method == 'POST') {
        let body = '';
        req.on('data', chunk => {
            body += chunk.toString();
        })

        if (req.url == '/login') {
            req.on('end', () => {
                var data = JSON.parse(body);
                con.query(`select user_id, username from users where username = '${data.username}' and password = '${data.password}'`, (err, result) => {
                    if (result.length == 0) {
                        console.log('no user found')
                    } else {
                        res.setHeader('Content-Type', 'application/json')
                        res.end(JSON.stringify(result));
                    }
                })
            });
        } else if (req.url == '/signup') {
            req.on('end', () => {
                var data = JSON.parse(body);
                //no pw hashing cuz lazy 🗿
                con.query(`insert into users(username, password) values('${data.username}', '${data.password}')`, (err, result) => {
                    console.log(JSON.stringify(result));
                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify({
                        msg: 'registered'
                    }));
                });
            });
        } else if(req.url == '/add-to-cart'){
            req.on('end', () => {
                var data = JSON.parse(body);
                con.query(`insert into user_cart(user_id, product_id) values('${data.user_id}', '${data.product_id}')`, (err, result) => {
                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify({
                        msg: 'item added'
                    }))
                })
            })
        } else if(req.url == '/search'){
            req.on('end', () => {
                var data = JSON.parse(body);
                con.query(`select * from products where product_name like '%${data.search}%'`, (err, result) => {
                    res.setHeader('Content-Type', 'application/json');
                    res.end(JSON.stringify(result))
                })
            })
        }
    }
});

server.listen(3000);