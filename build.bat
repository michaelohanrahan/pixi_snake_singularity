pixi install
docker build -t pix-smk:naive .
docker run --rm -it -p 8000:8000 pix-smk:naive
docker history pix-smk:naive
docker image ls pix-smk:naive