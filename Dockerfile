FROM cpclermont/lighthouse-ci-action:2.0.0
RUN npm install -g n && n 20
RUN npm install -g @shopify/cli
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
