/*
Name: Akshath Jain
Date: 3/26/19
Purpose: define the server index
*/

const express = require("express");
const app = express();

// The HelloWorld
app.get("/", (req, res) => {
    var obj = {
        "doorOpen":true,
    }

    res.send(obj);
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`App listening on http://localhost:${port}`);
});