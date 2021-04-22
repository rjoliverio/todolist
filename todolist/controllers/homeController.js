const task=require("../models/task");
const account=require("../models/account");

exports.viewHome=async (req,res)=>{
    if(req.query.success===undefined){
        req.query.success='{}';
    }
    let userdata=await account.model.findAll({
        where:{
            uuid:req.session.uuid
        }
    })
    let taskdata=await task.model.findAll({
        where:{
            uuid:req.session.uuid,
            status:0
        }
    })
    res.render("home",{account:userdata[0],data:taskdata,msg:JSON.parse(req.query.success)});
}
exports.viewCompleted=async (req,res)=>{
    let userdata=await account.model.findAll({
        where:{
            uuid:req.session.uuid
        }
    })
    let taskdata=await task.model.findAll({
        where:{
            uuid:req.session.uuid,
            status:1,
        }
    })
    res.render("completed",{account:userdata,data:taskdata});
}
exports.createTask=async (req,res)=>{
    req.body.uuid=req.session.uuid;
    req.body.status=0;
    task.model.create(req.body);
    res.redirect("/home");
}
exports.editTask=async (req,res)=>{
    task.model.update({ task: req.body.task }, {
        where: {
          id: req.params.id,
          uuid:req.session.uuid
        }
    });
    res.redirect("/home");
}
exports.doneTask=async (req,res)=>{
    var success={code:'success',status:"Nice!",message:"You have completed 1 task."};
    task.model.update({ status: 1 }, {
        where: {
          id: req.params.id,
          uuid:req.session.uuid
        }
    });
    res.redirect("/home/?success="+JSON.stringify(success));
}
exports.deleteTask=async (req,res)=>{
    var success={code:'danger',status:"Notice!",message:"You deleted 1 task."};
    task.model.destroy({
        where: {
          id: req.params.id,
          uuid:req.session.uuid
        }
      });
    res.redirect("/home/?success="+JSON.stringify(success));
}