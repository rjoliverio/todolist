'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
     await queryInterface.createTable("tasks",{
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
      task:{
        type:Sequelize.STRING,
        allowNull:false
      },
      status:{
        type:Sequelize.BOOLEAN,
        allowNull:false
      },
      completedAt:{
        type:Sequelize.DATE
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
     await queryInterface.dropTable("tasks");
  }
};
