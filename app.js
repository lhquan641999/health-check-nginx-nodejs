// app.js

const http = require('http');

// const server = http.createServer((req, res) => {
//   res.statusCode = 200;
//   res.setHeader('Content-Type', 'text/plain');
//   res.end('Hello, World!\n');
// });

// server.listen(3000, () => {
//   console.log('Server running on port 3000');
// });

// const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/health') { // check if the request is for /health
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Server is healthy\n');
  } else { // handle all other requests with the default 'Hello, World!' response
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello, World!\n');
  }
});

server.listen(3000, () => {
  console.log('Server running on port 3000');
});