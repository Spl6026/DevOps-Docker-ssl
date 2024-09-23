FROM ubuntu:22.04

LABEL maintainer="SPL <sgpolin@gmail.com>"

EXPOSE 80

RUN mkdir -p /home/app

RUN apt update

RUN apt install -y curl

RUN apt install -y vim

RUN apt install -y debconf-utils

RUN apt install -y dotnet-sdk-6.0

RUN apt install -y libgdiplus

RUN mkdir -p /usr/share/fonts/local_fonts

COPY ./fonts/* /usr/share/fonts/local_fonts/

COPY ./app /home/app

ENV ConnectionStrings__DefaultConnection="server=mariadb;user id=root;password=1234;database=kid;charset=utf8;"

CMD ["dotnet", "run", "--project", "./home/app"]
