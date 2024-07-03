FROM ubuntu:24.04
RUN apt-get update -q --fix-missing \
 && DEBIAN_FRONTEND=nontineractive apt-get install -qy --no-install-recommends curl gpg-agent software-properties-common \
 && add-apt-repository -y ppa:criu/ppa \
 && install -m 0755 -d /etc/apt/keyrings \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
 && chmod a+r /etc/apt/keyrings/docker.asc \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |tee /etc/apt/sources.list.d/docker.list > /dev/null \
 && apt-get update -q --fix-missing \
 && DEBIAN_FRONTEND=nontineractive apt-get remove -qy software-properties-common \
 && DEBIAN_FRONTEND=nontineractive apt-get install -qy --no-install-recommends criu docker-ce-cli gawk git iptables jq less libcap2-bin openssh-client patch pigz python3 python3-venv rsync tmux=3.4-1build1 vim wget \
 && setcap 'cap_checkpoint_restore+eip cap_sys_admin+eip' "$(command -v criu)" \
 && apt-get clean autoclean \
 && apt-get autoremove --yes \
 && rm -rf /var/lib/apt/lists/*
COPY wrapper /usr/local/sbin/
CMD ["wrapper"]
