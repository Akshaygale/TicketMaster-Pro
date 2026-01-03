FROM node:18
WORKDIR /app
COPY app/backend .
RUN npm instal 
CMD [ "node", "app.js" ]