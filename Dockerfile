# kon si base image lagegi esa image lu jisme build in node js ho
FROM node AS dhondhu
# hame naya folder banana hai and cd karna hai usme workdir se mkdir and cd both hoga
WORKDIR /dhondhu
# ab terminal /dhondhu $ p aa gaya hai

# ab hame elearn-fontend $ se /dhondhu $ . p copy karna hi
COPY . .
#upar jo 2 dot hai usme pehla wala host ki current location hai 2nd wala dot us location ka hai jo workdir ne banaya tha
# COPY C:/elearn-frontend /dhondhu 

#container k andar command run karne ke liye
RUN npm install

# build folder ban gaya neecehe command s
RUN npm run build   


FROM nginx:alpine-slim AS temu 
COPY --from=dhondhu /dhondhu/build /usr/share/nginx/html

