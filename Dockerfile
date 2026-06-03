FROM node:20-buster-slim AS node20
FROM cpclermont/lighthouse-ci-action:2.0.0
COPY --from=node20 /usr/local/bin/node /usr/local/bin/node
# Pin to the last Shopify CLI release that supports Node 20. CLI 4.0.0+ requires
# Node >=22.12 and crashes on the bundled Node 20 binary with:
#   "module 'node:module' does not provide an export named 'enableCompileCache'".
# The base image is Debian buster (glibc 2.28); Node 22 images are bullseye+ only
# (glibc 2.31), so the copied-binary approach can't move to Node 22 without
# rebuilding the base image.
RUN npm install -g @shopify/cli@3.94.3
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
