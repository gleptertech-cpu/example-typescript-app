import * as http from "node:http";

const port = Number(process.env.PORT) || 3000;

const server = http
  .createServer((req, res) => {
    const start = Date.now();

    if (req.url === "/health") {
      res.writeHead(200, { "Content-Type": "application/json" });
      res.end(JSON.stringify({ status: "ok" }));
    } else {
      res.writeHead(200, { "Content-Type": "text/plain" });
      res.end("Hello World!");
    }

    res.on("finish", () => {
      console.log(
        JSON.stringify({
          method: req.method,
          path: req.url,
          status: res.statusCode,
          durationMs: Date.now() - start,
        }),
      );
    });
  })
  .listen(port, () => {
    console.log(`Listening on http://localhost:${port}`);
  });

// Graceful shutdown: stop accepting new connections and let in-flight
// requests finish before exiting, so an ECS deploy/stop doesn't cut
// requests off mid-response.
function shutdown(signal: string) {
  console.log(`Received ${signal}, shutting down`);
  server.close(() => {
    console.log("Closed out remaining connections");
    process.exit(0);
  });

  // Don't hang forever if a connection never closes.
  setTimeout(() => {
    console.error("Forcing shutdown after timeout");
    process.exit(1);
  }, 10_000).unref();
}

process.on("SIGTERM", () => shutdown("SIGTERM"));
process.on("SIGINT", () => shutdown("SIGINT"));
