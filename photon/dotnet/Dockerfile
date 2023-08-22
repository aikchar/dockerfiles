FROM docker.io/library/photon:5.0

RUN    tdnf makecache \
    && tdnf install -y curl rpm \
    && rpm --import https://packages.microsoft.com/keys/microsoft.asc \
    && curl -L -o /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/rhel/9/prod.repo \
    && tdnf makecache \
    && tdnf install -y dotnet-runtime

# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
