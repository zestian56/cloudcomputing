const http = require('http');
const podname= process.env.HOSTNAME;

let requests=0;
let startTime;
let host;

const handleRequest = function(_request, response) {
  response.setHeader('Content-Type', 'text/plain');
  response.writeHead(200);
  response.write(`"Hello Kubernetes from ${podname}! | Running on: ${host} `);
  response.end(" | v=1\n");
  console.log("Running On:" ,host, "| Total Requests:", ++requests,"| App Uptime:", (new Date() - startTime)/1000 , "seconds", "| Log Time:",new Date());
}
const www = http.createServer(handleRequest);
www.listen(8080,function () {
    startTime = new Date();;
    host = process.env.HOSTNAME;
    console.log ("Kubernetes App Started At:",startTime, "| Running On: " ,host, "\n" );
});
