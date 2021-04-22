const express=require('express');
const bodyParser = require('body-parser');
const { render } = require('ejs');
const session = require('express-session');
const app=express();
const accountRoutes=require('./routes/accountRoutes');
const homeRoutes=require('./routes/homeRoutes.js');
app.use(session({secret: 'session',saveUninitialized: true,resave: true}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(express.static("public"));

app.set('view engine','ejs');

app.get("/",(req,res)=>{
    if(req.session.uuid){
        res.redirect('/home/');
    }else{
        res.render("index");
    }
})
app.use("/account",accountRoutes)
app.use("/home",homeRoutes)
app.get("/logout",(req,res)=>{
    req.session.destroy((err) => {
        if(err) {
            return console.log(err);
        }
        res.redirect('/');
    });
})
app.use("*",(req,res)=>{
    res.render("404");
});
app.listen(3000);