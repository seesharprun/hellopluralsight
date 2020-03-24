FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build

ENV APP_DIR /app

RUN mkdir -p ${APP_DIR}

RUN addgroup -S projects && adduser -S projects -G projects

WORKDIR ${APP_DIR}

COPY . .

RUN chown -R projects:projects ${APP_DIR}

USER projects

RUN dotnet build ${APP_DIR}/src/Hello.Interface/Hello.Interface.csproj

RUN dotnet build ${APP_DIR}/src/Hello.Interface.Tests/Hello.Interface.Tests.csproj

ENTRYPOINT ["/bin/sh"]