FROM alpine:latest
ADD .bashrc /root/.bashrc

# Install Vim
RUN apk add vim

# Install git
RUN apk add git

# Install nodejs
RUN apk add nodejs
RUN apk add npm

# Install tools used by vim plugins
RUN apk add fzf
RUN apk add ripgrep
RUN apk add the_silver_searcher

# Install utilities
RUN apk add curl less man-pages bash tmux ncurses

# Install Java 17
RUN apk add openjdk17-jdk

# Install Vim Plug
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN cd /root
RUN mkdir .vim

# Get Vim Config
ADD .vimrc /root/.vimrc

# Get Tmux Config
ADD .tmux.conf /root/.tmux.conf

# Add Coc Configs
ADD .vim/coc-settings.json /root/.vim/coc-settings.json
ADD .vim/coc.vim /root/.vim/coc.vim

# Install vim plugins
# RUN vim -c "PlugInstall" -c "qa"
# Install plugins
RUN vim +PlugInstall +qall >> /dev/null

# Install Tmux Plugin Manager
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Tmux plugins
# RUN ~/.tmux/plugins/tpm/bin/install_plugins

# Download JDT Language Server
RUN curl -fLo ~/jdt-language-server/jdt-language-server-latest.tar.gz --create-dirs \
	https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz

RUN mkdir ~/.config
RUN mkdir ~/.config/coc
RUN mkdir ~/.config/coc/extensions
RUN mkdir ~/.config/coc/extensions/coc-java-data
RUN mkdir ~/.config/coc/extensions/coc-java-data/server
RUN tar -xzvf ~/jdt-language-server/jdt-language-server-latest.tar.gz -C ~/.config/coc/extensions/coc-java-data/server

# install coc-java & coc-json and exit
RUN vim -c 'CocInstall -sync coc-java coc-json coc-vimlsp|q' >> /dev/null

# Keep container running in background
CMD tail -f /dev/null

