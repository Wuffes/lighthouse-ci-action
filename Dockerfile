FROM node:20-buster-slim AS node20
FROM cpclermont/lighthouse-ci-action:2.0.0
COPY --from=node20 /usr/local/bin/node /usr/local/bin/node
RUN npm install -g @shopify/cli
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
