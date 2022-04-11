const express = require("express");
const req = require("express/lib/request");
const res = require("express/lib/response");
const { use } = require("express/lib/router");
const app = express();
const port = 3001;
app.set("view engine", "ejs");
app.set("views", "./views");
app.use(express.static("public"));
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

var bodyParser = require('body-parser')

var mysql = require("mysql");
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    database: "labnodejs",
    password: "",
})
//routers

app.get("/txn", (req, res) => {
    let sqlTXN = "SELECT * FROM tin ORDER BY SoLanXem DESC LIMIT 10";
    db.query(sqlTXN, (err, listSach) => {
        if (err) throw err;
        // console.log(listSach);
        return res.json(listSach);
    })
});


app.get("/tnb", (req, res) => {

    let sql_xemnhieu = "select * from tin where  10";
    db.query(sql_xemnhieu, (err, result) => {
        return res.json(result);
    });
});

app.get("/tin/:id", (req, res) => {
    let sql = `select * from tin where idTin = ${req.params.id}`;
    db.query(sql, (err, TIN) => {
        if (err) throw err;
        return res.json(TIN);
    })
});

app.get("/home", (req, res) => {
    let sqlTXN = "select * from sach";
    db.query(sqlTXN, (err, listSach) => {
        if (err) throw err;
        return res.render('listSach', {
            listSach: listSach
        });
    })
});





app.get("/admin/login", (req, res) => {

    res.render('Login.ejs', { });

});


app.get("/cat/:cateId", (req, res) => {
    let id = req.params.cateId;
    let sql = `select * from loai`;
    let sqlSach = `select * from sach WHERE idLoai=${id}`;
    db.query(sql, function (err, listLoai) {
        db.query(sqlSach, function (err, listSach) {
            if (err) throw err;
            res.render('shop', { loaiSach: listLoai, listSach: listSach });
        });
    });
});

app.get("/cat/:cateId", (req, res) => {
    let id = req.params.cateId;
    let sql = `select * from loai`;
    let sqlSach = `select * from sach WHERE idLoai=${id}`;
    db.query(sql, function (err, listLoai) {
        db.query(sqlSach, function (err, listSach) {
            if (err) throw err;
            res.render('shop', { loaiSach: listLoai, listSach: listSach });
        });
    });
});

app.get("/sach/:idSach", (req, res) => {

    let id = req.params.idSach;

    let sqlSach = `select tenSach, moTa, urlHinh, capNhat, gia from sach WHERE idSach=${id}`;

    db.query(sqlSach, function (err, singleSach, fields) {

        if (err) throw err; 

        const singleBook = singleSach[0];

        res.render('chitietsanpham', { singleBook });
    });

});
app.post('/Login', function(req, res) {
    let u = req.body.username;
    let p = req.body.password; 
    let user_info ={username: u, password:p};  
    let sqluser_info = `select * from users 
    where userNam = '${user_info.username}' AND password = '${user_info.password}'
    AND role = 1 
    `;

    db.query(sqluser_info, function(err, result) {
        if (result.length == 0) {

            res.redirect("/trangchu");
        }
        else {
            res.redirect("/admin");
        }
    });
})

app.get("/trangchu/dangki", (req, res) => {
    res.render('dangki', { });
});

app.post('/dangki', function(req, res) {
    let u = req.body.username;
    let p = req.body.password;
    let em = req.body.hoten;  
    let user_info ={username: u, password:p, hoten:em};  
    let sql = `INSERT INTO users( userNam, password, fullName) value('${u}','${p}','${em}') ` ;
    db.query(sql, user_info);
    res.redirect("/admin/Login");
});

app.get("/admin", (req, res) => {
    let sql = "select idLoai, tenLoai from loai";
    let sqlSach = "select idSach, tenSach, moTa, urlHinh, gia from sach"
    db.query(sql, (err, listLoai) => {
        if (err) throw err;
        db.query(sqlSach, (err, listSach) => {
            if (err) throw err;
            // console.log(listSach);
            res.render('admin', { loaiSach: listLoai, listSach: listSach });
        })
    });
});

app.post("/xoasp", (req,res) => {

    var idProduct = req.body.idSach;

    let delSach = `delete from sach where idSach=${idProduct}`;

    db.query(delSach, (err, listSach) => {

        if (err) throw err;

        res.redirect('/admin');
    });
});



app.listen(port, () => console.log('Ung dung dang chay' + port));

