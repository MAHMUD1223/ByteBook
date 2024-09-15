# Use an official Ubuntu as a base image
FROM ubuntu:latest

# Install essential tools and dependencies
RUN apt-get update && apt-get install -y \
    nasm \
    gcc \
    gdb \
    make \
    vim \
    build-essential \
    git \
    libncurses5-dev \
    libncursesw5-dev \
    nano \
    file

# Set the working directory
WORKDIR /workspace
COPY vimrc /root/.vimrc
COPY gdbinit /root/.gdbinit
COPY converter /workspace/converter
RUN chmod +x /workspace/converter

# Command to run when starting the container
CMD ["/bin/bash"]
