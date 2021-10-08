FROM node:16.8.0
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production
RUN node --version
RUN java --version
RUN google-chrome --version
RUN npm install yo generator-hubot --version
RUN npm fund
RUN npm install npm@7.23.0 --save-dev
RUN mkdir my-awesome-hubot && cd my-awesome-hubot
RUN npm fund
RUN npm install npm@7.23.0 --version
RUN npm audit fix --force
RUN npm fund  
RUN echo "my artifact file" > /tmp/art-1;
RUN mkdir /tmp/artifacts;
RUN echo "my artifact files in a dir" > /tmp/artifacts/art-2;
RUN yarn hubot HUBOT_SLACK_TOKEN=${{ secrets.HUBOT_SLACK_TOKEN }} ./bin/hubot --adapter=slack

COPY . .

CMD [ "node", "server.js" ]
