JiDe
====

JiDe (記得), means "memorize" in Mandarin. This project is a web-based flashcard
application for memorizing Mandarin characters and their associated Pinyin.

This repo contains a golang service which provides a GraphQL API and a static
file server. The static file server serves a SPA web application that is built
with React.

Usage
-----
To run jide in a local development environment, you need docker and kubernetes.
I recommend installing docker-for-mac and enabling kubernetes.

To edit the service's code and see changes applied to containers in the
development environment we use `ksync`. Install from
[https://github.com/vapor-ware/ksync](https://github.com/vapor-ware/ksync)

```bash
git clone git@github.com:cflynn07/jide.git && cd ./jide
```

To develop locally use
[skaffold](https://github.com/GoogleContainerTools/skaffold).

```bash
skaffold dev
```

The application should be accessible in your browser at `http://localhost:3000`  

Tests
-----
