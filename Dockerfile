FROM nixos/nix

RUN nix-shell https://holochain.love 

RUN apk add \
	git \
	wget \
	vim \
	zsh

RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 


RUN git config --global user.name "John Doe"
RUN git config --global user.email johndoe@example.com

RUN apk add --update nodejs npm
RUN apk --no-cache --update add build-base

ARG WORKSPACE=/root
WORKDIR $WORKSPACE
COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim

RUN vim +PlugInstall +qall 

CMD ["zsh"]
