
const http = require('http');
const port = process.env.PORT || 3000;
 
let server = http.createServer((req, res) => {
    let html = `<h1>bao bao 1111 1111</h1>`;
    // Add new code to test the live reload
    html += `<h2>As of: ${new Date()}</h2><br>`;
    // Iterate over `process.env` object and
    // print its values.
    Object.keys(process.env).forEach((k) => {
        html += `${k} = ${process.env[k]} <br>`
    });
    // Set the response status and response content 
    // type header
    res.writeHead(200, {
        'content-type': 'text/html'
    });
    return res.end(html);
});
 
// start listening
server.listen(port);
console.log(`Server running on port ${port}`);