const {DataTypes}=require('sequelize');
const instance=require('../connection');

const account=instance.sequelize.define("accounts",{
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
      username:{
        type:DataTypes.STRING,
        allowNull:false
      },
      password:{
        type:DataTypes.STRING,
        allowNull:false
      },
      type:{
        type:DataTypes.ENUM('admin','client'),
        allowNull:false
      },
      fname:{
        type:DataTypes.STRING,
        allowNull:false
      },
      lname:{
        type:DataTypes.STRING,
        allowNull:false
      }
    },{
        createdAt:true,
        updatedAt:true,
        deletedAt:true,
        tableName:"accounts"
    }
);
exports.model=account;