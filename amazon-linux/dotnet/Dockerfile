FROM amazonlinux:2

# Since .NET 6 is not supported on CentOS 8, we have to use manual install
# We are also forced to use manual install on aarch64
RUN    yum makecache \
    && yum install -y coreutils gawk gzip krb5-libs libicu libstdc++-devel openssl-libs tar zlib \
    && curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel Current --runtime aspnetcore --install-dir /usr/local/dotnet \
    && ln -s /usr/local/dotnet/dotnet /usr/local/bin/dotnet

# Use on x86_64
# RUN    rpmkeys --import 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF' \
#     && curl -o /etc/yum.repos.d/mono-centos8-stable.repo https://download.mono-project.com/repo/centos8-stable.repo \
#     && yum makecache \
#     && yum install -y libgdiplus

# https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-centos
