FROM debian:11


RUN   apt update \
    && apt install -y curl \
    && curl -o /tmp/packages-microsoft-prod.deb https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb \
    && apt install -y /tmp/packages-microsoft-prod.deb \
    && rm /tmp/packages-microsoft-prod.deb \
    && apt update \
    && apt install -y dotnet-sdk-7.0
