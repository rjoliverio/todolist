'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
    await queryInterface.createTable("accounts",{
      id:{
        type:Sequelize.BIGINT,
        autoIncrement:true,
        primaryKey:true,
        allowNull:false
      },
      uuid:{
        type:Sequelize.STRING,
        allowNull:false
      },
      username:{
        type:Sequelize.STRING,
        allowNull:false
      },
      password:{
        type:Sequelize.STRING,
        allowNull:false
      },
      type:{
        type:Sequelize.ENUM('admin','client'),
        allowNull:false
      },
      fname:{
        type:Sequelize.STRING,
        allowNull:false
      },
      lname:{
        type:Sequelize.STRING,
        allowNull:false
      },
      createdAt:{
        type:Sequelize.DATE,
        allowNull:false
      },
      updatedAt:{
        type:Sequelize.DATE,
      },
      deletedAt:{
        type:Sequelize.DATE,
      },
    })
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
    await queryInterface.dropTable("accounts");
  }
};
