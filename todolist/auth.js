const express=require("express");
const app=express();
const account=require("./models/account");

exports.registerMiddleware=async(req,res,next)=>{
    var data={};
    if(req.body.password===req.body.repeatPassword){
        next();
    }else{
        res.render("register",{data:{code:'danger',status:"Failed!",message:"Password mismatch"}});
    }
}
exports.sessionChecking=async(req,res,next)=>{
    if(req.session.uuid){
        next();
    }else{
        res.redirect('/');
    }
}
exports.registerChecking=async(req,res,next)=>{
    if(req.session.uuid){
        res.redirect('/home');
    }else{
        next();
    }
}