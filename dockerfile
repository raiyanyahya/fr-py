from debian:11
LABEL maintainer="Raiyan Yahya <raiyanyahyadeveloper@gmail.com>"
RUN apt update -y && apt-get update -y && apt-get install --no-install-recommends -y python3-pip sudo git curl zsh wget nano lsof && \
        rm -rf /var/lib/apt/lists/* && \
	      apt-get clean && \
        apt-get autoclean && \
        apt-get autoremove
RUN useradd -m -s /bin/zsh --home /home/devuser -G sudo devuser && echo "devuser:devuser" | chpasswd

USER devuser
ENV TERM xterm
WORKDIR /home/devuser
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

CMD ["zsh"]
