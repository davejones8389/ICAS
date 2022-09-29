FROM mcr.microsoft.com/dotnet/sdk:6.0

# Install packages
RUN apt-get update -qq
RUN apt-get install -qqy --no-install-recommends \
        curl \
        ca-certificates \
        gcc \
        git \
        python3-dev \
        python3-pip \
        make \
        cmake

# Has to come through pip for apple silicon (arm64/v8)
RUN pip install --upgrade pip
RUN pip install azure-cli

# sqlpackage
RUN apt-get install -qqy --no-install-recommends \
        libunwind8

RUN dotnet new --install MSBuild.Sdk.SqlProj.Templates
