FROM mcr.microsoft.com/mssql/server:2022-latest

# Create a config directory
RUN mkdir -p /usr/config
WORKDIR /usr/config

# Bundle config source
COPY . /usr/config

USER 0
# Grant permissions for to our scripts to be executable
RUN chmod +x /usr/config/entrypoint.sh
RUN chmod +x /usr/config/configure-db.sh

USER mssql
EXPOSE 1433
ENTRYPOINT ["./entrypoint.sh"]