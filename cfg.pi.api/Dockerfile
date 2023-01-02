#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0.12-bullseye-slim-arm32v7 AS base

# FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
EXPOSE 7048

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

COPY ["cfg.pi.webapi/cfg.pi.webapi.csproj", "cfg.pi.webapi/"]
RUN dotnet restore "cfg.pi.webapi/cfg.pi.webapi.csproj"
COPY . .
WORKDIR "/src/cfg.pi.webapi"
RUN dotnet build "cfg.pi.webapi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "cfg.pi.webapi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "cfg.pi.webapi.dll"]   