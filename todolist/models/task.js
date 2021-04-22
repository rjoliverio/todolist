const {DataTypes}=require('sequelize');
const instance=require('../connection');

const task=instance.sequelize.define("tasks",{
    id:{
        type:DataTypes.BIGINT,
        autoIncrement:true,
        primaryKey:true,
        allowNull:false
      },
      uuid:{
        type:DataTypes.STRING,
        allowNull:false
      },
      task:{
        type:DataTypes.STRING,
        allowNull:false
      },
      status:{
        type:DataTypes.BOOLEAN,
        allowNull:false
      },
      completedAt:{
        type:DataTypes.DATE
      },
    },{
        createdAt:true,
        updatedAt:true,
        deletedAt:true,
        tableName:"tasks"
    }
);
exports.model=task;