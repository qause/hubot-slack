FROM node:16.8.0
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production
RUN npm install -g yo generator-hubot
RUN npm install -g npm@7.23.0
RUN npm fund
RUN mkdir my-awesome-hubot && cd my-awesome-hubot
RUN yo hubot --adapter=slack
RUN HUBOT_SLACK_TOKEN=xoxb-2401417445287-2495753722914-ob25PEUD9GtHI9tgFCOFzyoK ./bin/hubot --adapter slack

COPY . .

CMD [ "node", "server.js" ]

