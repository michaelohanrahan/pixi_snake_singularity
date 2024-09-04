FROM ghcr.io/prefix-dev/pixi:0.26.1 AS build
# Install Git
RUN apt-get update && apt-get install -y git build-essential

WORKDIR /app
COPY workflow /app/workflow
COPY pixi.lock /app/pixi.lock
COPY pixi.toml /app/pixi.toml
# COPY pyproject.toml ./app/pyproject.toml
RUN pixi install --locked && rm -rf ~/.cache/rattler
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod 700 /app/entrypoint.sh
EXPOSE 8000
CMD [ "pixi", "run", "entrypoint.sh"]