@echo off
REM Build Docker image
docker build -t pix-smk .
docker save pix-smk > pix-smk.tar

REM Prompt user for Singularity build
set /p build_singularity="Do you want to build the Singularity image? (y/n): "

if /i "%build_singularity%"=="y" (
    REM Open Ubuntu WSL and build Singularity image
    echo Building Singularity image...
    wsl -d Ubuntu -e bash -c "cd /mnt/c/git/pixi_container_snake && sudo singularity build pix-smk.sif docker-archive://pix-smk.tar"

    REM Change ownership of the SIF file
    wsl -d Ubuntu -e sudo chown $(wsl whoami):$(wsl whoami) /mnt/c/git/pixi_container_snake/pix-smk.sif

    echo Singularity image built successfully.
) else (
    echo Skipping Singularity image build.
)

echo Build process complete.