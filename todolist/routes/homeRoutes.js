const express=require('express');
const router=express.Router();
const homeController=require("../controllers/homeController");
const auth=require("../auth");

router.get("/",auth.sessionChecking,homeController.viewHome);
router.get("/completed",auth.sessionChecking,homeController.viewCompleted);
router.post("/create",homeController.createTask);
router.post("/edit/:id",homeController.editTask);
router.get("/done/:id",homeController.doneTask);
router.get("/delete/:id",homeController.deleteTask);
module.exports=router;