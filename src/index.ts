import * as http from "node:http";

const port = Number(process.env.PORT) || 3000;

http
  .createServer((_req, res) => {
    res.writeHead(200, { "Content-Type": "text/plain" });
    res.end("Hello World!");
  })
  .listen(port, () => {
    console.log(`Listening on http://localhost:${port}`);
  });
