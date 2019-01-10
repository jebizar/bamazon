var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "lol",
  database: "bamazon"
});


connection.connect(function(err) {
    if (err) throw err;
    console.log("connected");
    
    welcome();
  });

  function welcome(){
      connection.query("select * from products", function(err,res){
          if(err) throw err;
          console.table(res);
          inquirer.prompt([{
            name:"id",
            type:"input",
            message:"What product ID would you like to buy?"
        },
        {
          name:"quantity",
          type:"input",
          message:"How many would you like to buy?"
        }])
        .then(function(answer){
            connection.query("select stock_quantity,price from products where ?", {id: answer.id}, function(err,res){
                var stock = res[0].stock_quantity;
                var price = res[0].price;
                if(answer.quantity > stock){
                    console.log("Insufficient quantity!");
                    connection.end();
                }
                else{
                    var subtract = stock - answer.quantity;
                    var update = `update products set stock_quantity = ${subtract} where id = ${answer.id}`;
                    var cost = price * answer.quantity;
                    console.log(`Your total will come to $${cost}`);
                    connection.query(update);
                    connection.end();
                }
            });   
        });
      });
  }