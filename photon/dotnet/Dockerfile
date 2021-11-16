FROM photon:4.0

RUN    tdnf makecache \
    && tdnf install -y coreutils gawk icu-devel libstdc++-devel \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current --runtime aspnetcore --install-dir /usr/local/dotnet

ENV PATH="/usr/local/dotnet:${PATH}"

# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
