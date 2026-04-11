FROM alpine:3.14

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    software-properties-common curl git build-essential unzip nodejs npm python3 python3-pip \
    && add-apt-repository ppa:neovim-ppa/unstable -y \
    && apt-get update && apt-get install -y neovim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.config/nvim /workspace
WORKDIR /workspace

# Copiamos tu config
COPY . /root/.config/nvim/

# En lugar de instalar en el build, dejamos que lo haga al abrirse
ENTRYPOINT ["nvim"]
