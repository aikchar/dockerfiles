FROM opensuse/leap:15.3

# Use on aarch64
RUN    zypper refresh \
    && zypper install -y curl gzip libicu tar \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current --runtime aspnetcore --install-dir /usr/local/dotnet \
    && ln -s /usr/local/dotnet/dotnet /usr/local/bin/dotnet

# Use on x86_64
# RUN    rpm --import https://packages.microsoft.com/keys/microsoft.asc \
#     && curl -o /etc/zypp/repos.d/microsoft-prod.repo https://packages.microsoft.com/config/opensuse/15/prod.repo \
#     && zypper refresh \
#     && zypper install -y aspnetcore-runtime-6.0

# https://docs.microsoft.com/en-us/dotnet/core/install/linux-opensuse
# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual
