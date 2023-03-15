FROM node:lts-alpine

COPY package.json package-lock.json /app/

WORKDIR /app

# First install dependencies
RUN npm install --production
RUN cp -r node_modules/reveal.js-copycode/plugin/copycode node_modules/reveal.js/plugin/copycode

# Install app
COPY . /app

EXPOSE 1948

WORKDIR /slides
ENTRYPOINT [ "node", "/app/bin/reveal-md.js" ]
CMD [ "/slides" ]
