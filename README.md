# example-typescript-app

This is a sample project.

A hello world TypeScript web server.

```
npm install
npm run build
npm start
```

Listens on http://localhost:3000 (override with `PORT`).

- `GET /` responds with `Hello World!`.
- `GET /health` responds `200 {"status":"ok"}`, for use as a container/load-balancer health check.

Each request is logged as a single JSON line (method, path, status, duration). On `SIGTERM`/`SIGINT` the server stops accepting new connections, lets in-flight requests finish, then exits — so a deploy or container stop doesn't cut off an in-progress response.
