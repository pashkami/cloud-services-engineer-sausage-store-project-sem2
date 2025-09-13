# syntax=docker/dockerfile:1

ARG NODE_VERSION=12

################################################################################
# Use node image for base image for all stages.
FROM node:${NODE_VERSION}-alpine AS base

# Set working directory for all build stages.
WORKDIR /app


COPY package*.json ./

RUN npm install

# Copy the rest of the source files into the image.
COPY . .


# Собираем проект (production build)
RUN npm run build 


# -------- Stage 2: Nginx with static files --------
FROM nginx:1.27-alpine

RUN rm -rf /usr/share/nginx/html && mkdir -p /usr/share/nginx/html

COPY nginx.tmpl /etc/nginx/templates/default.conf.template
COPY --from=base /app/dist/frontend/ /usr/share/nginx/html
# Копируем кастомный конфиг nginx (если нужно настроить роутинг Angular)
# COPY nginx.conf /etc/nginx/conf.d/default.conf


# Expose the port that the application listens on.
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
