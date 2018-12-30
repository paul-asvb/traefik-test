var express = require('express');
var app = express();

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';


app.get('/hello', function (req, res) {
    res.send('Hello World!');
});

app.get('/*', function (req, res) {
    res.send(req.path);
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
