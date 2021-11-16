FROM opensuse/leap:15

RUN    zypper refresh \
    && zypper install -y curl gzip libicu tar \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current --runtime aspnetcore --install-dir /usr/local/dotnet

ENV PATH="/usr/local/dotnet:${PATH}"

# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
