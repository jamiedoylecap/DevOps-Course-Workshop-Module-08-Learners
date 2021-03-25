FROM mcr.microsoft.com/dotnet/sdk:5.0
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
#RUN npm install -g npm@7.7.4
RUN mkdir /app
WORKDIR /app
COPY . .
RUN dotnet build
WORKDIR /app/DotnetTemplate.Web
RUN npm install
RUN npm run build

ENTRYPOINT ["dotnet", "run"]