FROM docker.io/library/photon:5.0

# Use on aarch64 and x86_64
RUN    tdnf makecache \
    && tdnf install -y coreutils gawk icu-devel libstdc++-devel \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current --runtime aspnetcore --install-dir /usr/local/dotnet \
    && ln -s /usr/local/dotnet/dotnet /usr/local/bin/dotnet

# Use on x86_64
# DOES NOT WORK AS OF 2022-11-01
# RUN    rpm --import https://packages.microsoft.com/keys/microsoft.asc \
#     && curl -o /etc/yum.repos.d/microsoft-prod.repo https://packages.microsoft.com/config/opensuse/15/prod.repo \
#     && tdnf makecache \
#     && tdnf install -y coreutils gawk icu-devel libstdc++-devel aspnetcore-runtime-6.0 \
    # && rpmkeys --import 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF' \
    # && curl -o /etc/yum.repos.d/mono-centos8-stable.repo https://download.mono-project.com/repo/centos8-stable.repo \
    # && tdnf makecache \
    # && tdnf install -y libgdiplus

# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
