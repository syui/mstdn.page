FROM archlinuxjp/archlinux

WORKDIR /root

ENV URL https://gitlab.com/syui/mstdn.page/raw/master/public/index.html

ARG TOKEN

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
	base-devel git zsh curl --noconfirm

RUN git config --global user.email "syui@users.noreply.github.com"
RUN git config --global user.name "syui"
RUN git clone https://syui:${TOKEN}@gitlab.com/syui/mstdn.zsh.git
RUN git clone https://syui:${TOKEN}@gitlab.com/syui/mstdn.page.git
RUN cd mstdn.zsh;git pull
RUN cd mstdn.page;git pull

ADD user.json /root/mstdn.zsh/json

ADD bin/jq-32 /bin
ADD bin/jq-64 /bin
RUN if [ "`uname -m`" = "i686" ];then \
	ln -s /bin/jq-32 /bin/jq; \
    else \
    	ln -s /bin/jq-64 /bin/jq; \
    fi;
RUN chmod +x /bin/jq
RUN echo 'IgnorePkg = jq' >> /etc/pacman.conf

ENV PATH $PATH:/root/mstdn.zsh

CMD /bin/zsh
RUN jq --version
