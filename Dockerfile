FROM whanos-javascript

RUN npm install -g typescript@4.4.3

COPY . .

RUN tsc

RUN find . -name "*.ts" -type f -not -path "./node_modules/*" -delete

CMD ["node", "app.js"]