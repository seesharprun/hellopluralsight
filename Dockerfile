FROM mcr.microsoft.com/dotnet/core/sdk:5.0 AS build

WORKDIR /app

COPY . ./

RUN dotnet publish src/Hello.Interface/Hello.Interface.csproj --configuration Release --output out

FROM mcr.microsoft.com/dotnet/core/runtime:5.0

COPY --from=build /app/out .

ENTRYPOINT [ "dotnet", "Hello.Interface.dll" ]