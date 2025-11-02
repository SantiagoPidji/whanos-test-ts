FROM whanos-javascript

WORKDIR /app

COPY package*.json ./
RUN npm ci --loglevel=warn

COPY . ./

RUN npm install -g typescript@4.4.3
RUN npx tsc -p tsconfig.json

RUN find . -name "*.ts" -type f -not -path "./node_modules/*" -delete

CMD ["node", "app.js"]