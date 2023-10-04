FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y gromacs \
    apt-get install -y nvidia-driver-470

CMD ["gmx"]
