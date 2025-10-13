FROM debian:bookworm-slim
RUN apt update
RUN apt install -y git wsjtx gnupg wget apt-transport-https software-properties-common libasound2
RUN wget -O "/usr/share/keyrings/xpra.asc" https://xpra.org/xpra.asc
RUN wget https://raw.githubusercontent.com/Xpra-org/xpra/master/packaging/repos/bookworm/xpra.sources -O /etc/apt/sources.list.d/xpra.sources
RUN apt update
RUN apt install -y xpra
RUN wget -q https://download2.gridtracker.org/GridTracker2-2.250914.1-amd64.deb
RUN apt install -y ./GridTracker2-2.250914.1-amd64.deb
RUN wget -q http://files.js8call.com/2.2.0/js8call_2.2.0_20.04_amd64.deb
RUN apt install -y ./js8call_2.2.0_20.04_amd64.deb
RUN mkdir /etc/xdg/menus
ADD applications.menu /etc/xdg/menus/applications.menu
CMD xpra start --start=gridtracker2 --start=wsjtx --bind-tcp=0.0.0.0:8080 --html=on --enable-pings && tail -f /dev/null