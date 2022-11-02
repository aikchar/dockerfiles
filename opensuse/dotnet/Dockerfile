FROM registry.opensuse.org/opensuse/leap:15.4

RUN    rpm --import https://packages.microsoft.com/keys/microsoft.asc \
    && curl -o /etc/zypp/repos.d/microsoft-prod.repo https://packages.microsoft.com/config/opensuse/15/prod.repo \
    && zypper refresh \
    && zypper install -y aspnetcore-runtime-6.0

# https://docs.microsoft.com/en-us/dotnet/core/install/linux-opensuse
# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual
