FROM alpine:latest
ADD .bashrc /root/.bashrc

# Update Packages
RUN apk update

# Install ctags
RUN apk add ctags

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

# Install Vim Plug
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN cd /root
# Download Go binary
RUN wget https://go.dev/dl/go1.19.2.linux-amd64.tar.gz

# Extract Go in /root ($GOPATH=/root/go; $GOBIN=$GOPATH/bin)
RUN tar -xzvf go1.19.2.linux-amd64.tar.gz -C /root

RUN cd /root
RUN mkdir .vim

# Get Vim Config
ADD .vimrc /root/.vimrc

# Get Tmux Config
ADD .tmux.conf /root/.tmux.conf

# Add Coc Configs
ADD .vim/coc-settings.json /root/.vim/coc-settings.json
ADD .vim/coc.vim /root/.vim/coc.vim

# Install plugins
RUN vim +PlugInstall +qall >> /dev/null

# Install Tmux Plugin Manager
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Tmux plugins
# RUN ~/.tmux/plugins/tpm/bin/install_plugins

# install vimlsp-java & coc-json and exit
RUN vim -c 'CocInstall -sync coc-json coc-vimlsp|q' >> /dev/null

# Keep container running in background
CMD tail -f /dev/null
