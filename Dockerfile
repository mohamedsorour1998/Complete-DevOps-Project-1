FROM node
COPY app.js package.json  /nodeapp/
WORKDIR /nodeapp
RUN npm install
CMD ["node", "/nodeapp/app.js"]