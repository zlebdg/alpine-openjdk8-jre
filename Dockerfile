FROM alpine

#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk --update add ttf-dejavu openjdk8-jre bash && wget https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt && keytool -trustcacerts -keystore /usr/lib/jvm/default-jvm/jre/lib/security/cacerts -storepass changeit -noprompt -importcert -alias lets-encrypt-x3-cross-signed -file lets-encrypt-x3-cross-signed.pem.txt && rm lets-encrypt-x3-cross-signed.pem.txt && rm -rf /var/cache/apk/*

EXPOSE 8080

CMD java -jar app.jar
