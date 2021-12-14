FROM redhat/ubi8:8.5

RUN    dnf makecache \
    && dnf install -y dotnet-runtime-6.0 \
    && ln -s /usr/lib64/dotnet/dotnet /usr/local/bin/dotnet

# dotnet is automatically symlinked in these PATHs:
# - /usr/bin/
# - /bin/
# But for compatibility with other images in this repo we symlink in
# - /usr/local/bin/
