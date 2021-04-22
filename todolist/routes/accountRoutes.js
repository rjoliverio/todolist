const express=require('express');
const router=express.Router();
const accountController=require("../controllers/accountController");
const auth=require("../auth");
router.get("/register",auth.registerChecking,accountController.registerAccount);
router.post("/register",auth.registerMiddleware,accountController.createAccount);
router.post("/login",accountController.loginAccount);
module.exports=router;