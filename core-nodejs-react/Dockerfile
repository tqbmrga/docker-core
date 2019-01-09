# Stage 1 - the build process
FROM node:8.15.0-alpine
WORKDIR /usr/src/app
#RUN npx create-react-app app && 
#RUN cd app
COPY . ./
CMD ["npm", "start"]

# # Stage 2 - the production environment
# FROM nginx:1.12-alpine
# COPY --from=build-deps /usr/src/app/build /usr/share/nginx/html
# #EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]