#Pull base image.
FROM ubuntu:trusty

# Install.
RUN apt-get update \
	&& apt-get install -y curl file vim g++ gawk git make sudo uuid-runtime \
	&& localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash admin \
	&& echo 'admin ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER admin
WORKDIR /home/admin
ENV PATH=/home/admin/.linuxbrew/bin:/home/admin/.linuxbrew/sbin:$PATH \
    HOME=/home/admin \
	SHELL=/bin/bash \
	USER=admin
  
# Add files.
ADD . $HOME/Workspace/dotfiles

# Install Homebrew so script/install can install other deps
RUN sh $HOME/Workspace/dotfiles/homebrew/install.sh

# Define default command.
CMD ["bash"]
