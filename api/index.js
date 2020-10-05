const express = require('express');
const http = require('http');

const app = express();
const server = http.createServer(app);
const port = 3000;

app.use(express.json());

app.get('/api/currenttime', (req, res) => {
    let date_ob = new Date();
    const currentTime = {
        currentTime: date_ob,
    }
   return res.send(currentTime);
});
server.listen(port, () => {
 console.log(`Server running at port ${port}`);
});