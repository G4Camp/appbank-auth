FROM jboss/keycloak

ARG KEYCLOAK_USER=admin
ARG KEYCLOAK_PASSWORD=admin

ENV JAVA_OPTS="-server -Xms128m -Xmx256m -XX:MaxHeapSize=256M -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true -Dfile.encoding=UTF8 -Dkeycloak.profile.feature.upload_scripts=enabled"
ENV PORT=${PORT}
ENV KEYCLOAK_USER=${KEYCLOAK_USER}
ENV KEYCLOAK_PASSWORD=${KEYCLOAK_PASSWORD}
ENV DATABASE_URL=${DATABASE_URL}
ENV PROXY_ADDRESS_FORWARDING=true

COPY ./.docker/entrypoint.sh /opt/jboss/tools

EXPOSE $PORT

ENTRYPOINT ["/bin/sh", "/opt/jboss/tools/entrypoint.sh"]
CMD ["-b", "0.0.0.0"]