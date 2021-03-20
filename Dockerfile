FROM node:14.6

RUN npm install --global @nodosjs/cli@0.0.55 
COPY ./ /app 
RUN cd /app && npm install

WORKDIR /app 

CMD ["nodos", "server", "-h", "0.0.0.0"]
