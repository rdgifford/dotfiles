#Pull base image.
FROM ubuntu:trusty

# Install.
RUN apt-get update \
	&& apt-get install -y curl file vim g++ gawk git make sudo uuid-runtime \
	&& localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& useradd -m -s /bin/bash linuxbrew \
	&& echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew
WORKDIR /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
	SHELL=/bin/bash \
	USER=linuxbrew
  
# Add files.
ADD . $HOME/Workspace/dotfiles

# Install Homebrew so script/install can install other deps
RUN sh /Workspace/dotfiles/homebrew/install.sh

# Define default command.
CMD ["bash"]
