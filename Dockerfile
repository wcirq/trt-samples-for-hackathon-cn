FROM registry.cn-hangzhou.aliyuncs.com/trt2022/dev:latest
RUN apt update && apt install -y openssh-server
RUN mkdir /var/run/sshd  && \
    echo 'root:passwd' | chpasswd  && \
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config  && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd  && \
    echo "export VISIBLE=now" >> /etc/profile
CMD ["/usr/sbin/sshd", "-D"]
