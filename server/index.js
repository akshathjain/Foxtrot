/*
Name: Akshath Jain
Date: 3/26/19
Purpose: define the server index
*/

const express = require("express");
const app = express();

// The HelloWorld
app.get("/", (req, res) => {
    //randomly assign whether door is opened or closed
    var isOpen = Math.floor((Math.random() * 2)) == 0;
    var obj = {
        "doorOpen": isOpen,
    }

    res.send(obj);
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`App listening on http://localhost:${port}`);
});