# 1. Imagen base ultra ligera
FROM alpine:latest

# 2. Instalar dependencias esenciales para todos los lenguajes solicitados
# Incluye: Python, JS/TS, C++, Java, Rust y compatibilidad para LSPs
RUN apk add --no-cache \
    neovim \
    git \
    curl \
    build-base \
    unzip \
    nodejs \
    npm \
    python3 \
    py3-pip \
    bash \
    libstdc++ \
    g++ \
    gcompat \
    clang-extra-tools \
    clang \
    openjdk17-jre-headless \
    rust \
    cargo \
    tree-sitter-cli

# 3. Configurar directorios de trabajo
RUN mkdir -p /root/.config /workspace
WORKDIR /workspace

# 4. Crear el script de sincronización (Sincroniza pero NO abre nvim)
RUN echo -e '#!/bin/bash \n\
if [ ! -d "/root/.config/nvim" ]; then \n\
  echo "📥 Clonando configuración desde GitHub..." \n\
  git clone https://github.com/Hernan-Hernandezz/nvim.git /root/.config/nvim \n\
else \n\
  echo "🔄 Actualizando configuración..." \n\
  cd /root/.config/nvim && git pull \n\
  cd /workspace \n\
fi \n\
# Mensaje de bienvenida \n\
echo "✅ Entorno listo. Escribe nvim para empezar o exit para salir." \n\
/bin/bash' > /usr/local/bin/start.sh && chmod +x /usr/local/bin/start.sh

# 5. Punto de entrada: Ejecuta el script de sincronización y te deja en la terminal
ENTRYPOINT ["/usr/local/bin/start.sh"]
