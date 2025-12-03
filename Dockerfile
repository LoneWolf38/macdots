FROM ubuntu:latest


RUN apt-get update && \
  apt-get install -y git vim curl zsh bash build-essential procps curl file language-pack-en

WORKDIR /root/dotfiles


COPY . .


RUN chmod +x brew-install.sh 

CMD ["sh"]
