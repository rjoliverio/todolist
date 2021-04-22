const account=require("../models/account");
const bcrypt=require("bcrypt");
generateCode = () => {
    let generate = "";
    const char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const length = 32;
    for ( var i = 0; i < length; i++ ) {
        generate += char.charAt(Math.floor(Math.random() * char.length));
    }
    return generate;
}
exports.registerAccount=async (req,res)=>{
    res.render("register");
}
exports.createAccount=async (req,res)=>{
    req.body.uuid=generateCode();
    let data=await account.model.findAll({
        where:{
            username:req.body.username
        }
    })
    if(data.length==0){
        bcrypt.hash(req.body.password,10, function(err, hash) {
            delete req.body.repeatPassword;
            req.body.password=hash;
            req.body.type='client';
            account.model.create(req.body);
            res.render("index",{data:{code:'success',status:"Success!",message:"You can now login."}});
        }) 
    }else{
        res.render("register",{data:{code:'danger',status:"Failed!",message:"Username already exist"}});
    }
}
exports.loginAccount=async (req,res)=>{
    let user=await account.model.findAll({
        where:{
            username:req.body.username
        }
    })
    if(user.length!=0){
        bcrypt.compare(req.body.password, user[0].password, function(err, result) {
            if(result){
                req.session.uuid=user[0].uuid;
                res.redirect("/home");
            }else{
                res.render("index",{data:{code:'danger',status:"Failed!",message:"Incorrect Password"}});
            }
        })
    }else{
        res.render("index",{data:{code:'danger',status:"Failed!",message:"Username doesn't exist"}});
    }
}
