FROM node:19-alpine
WORKDIR /app
ENV PATH="./node_modules/.bin:$PATH"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
# Get the previously build files
COPY --from=0 /app/index.html .
COPY --from=0 /app/scss ./scss
COPY --from=0 /app/css ./css
COPY --from=0 /app/pages ./pages
COPY --from=0 /app/images ./images
# Http port (not 443)
EXPOSE 80
STOPSIGNAL SIGQUIT
CMD ["nginx", "-g", "daemon off;"]