#Pull base image.
FROM ubuntu:trusty

# Install.
RUN apt-get update \
	&& apt-get install -y software-properties-common curl file g++ gawk git make sudo uuid-runtime \
    && add-apt-repository ppa:jonathonf/vim \
    && apt update && apt install -y vim \
	&& localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash admin \
	&& echo 'admin ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers \
    && chown -R admin /home/admin/ \
    && chmod -R 755 /home/admin/

USER admin
WORKDIR /home/admin
ENV HOME=/home/admin \
	SHELL=/bin/bash \
	USER=admin \
    PATH=/home/admin/.linuxbrew/bin:/home/admin/.linuxbrew/sbin:$PATH 
  
# Add files.
ADD . $HOME/.dotfiles

# Install Homebrew so script/install can install other deps
RUN bash $HOME/.dotfiles/bin/dot
#RUN sh $HOME/.dotfiles/homebrew/install.sh \
    #&& sh $HOME/.dotfiles/script/bootstrap \
    #&& sh $HOME/.dotfiles/script/install

# Define default command.
CMD ["bash"]
