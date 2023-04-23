FROM node
COPY app.js package.json  /nodeapp/
WORKDIR /nodeapp
RUN npm install
EXPOSE 3000
CMD ["node", "/nodeapp/app.js"]