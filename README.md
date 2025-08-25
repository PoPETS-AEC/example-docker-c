# example-docker-c

Example of a Dockerized C application.

### Notes:
- Feel free to reuse and adapt it for your own software artifact or project.
- No attribution needed (see [The Unlicense](LICENSE)).
- If you use this as a starter repository, you will likely want to pick another
  license for your artifact.
- The [`.devcontainer/`](.devcontainer/) directory contains the config for
 integration with VS Code (see [guide
here](https://github.com/PoPETS-AEC/examples-and-other-resources/blob/main/resources/vs-code-docker-integration.md)).
- A [GitHub workflow](.github/workflows/build-push-docker-image.yaml)
  automatically builds the Docker image and pushes it to the Container Registry
(see [guide
here](https://github.com/PoPETS-AEC/examples-and-other-resources/blob/main/resources/github-workflow-docker-image.md)).

## Software requirements
- [Docker Engine 28.3.3 (should work with any recent version)](https://docs.docker.com/engine/install/)
- [git 2.39.5 (any version should work)](https://git-scm.com/downloads)

## Instructions

Start by cloning this repository:
- `git clone git@github.com:PoPETS-AEC/example-docker-c.git` (SSH)
- `git clone https://github.com/PoPETS-AEC/example-docker-c.git` (HTTPS)

Then, follow either set of instructions:

> <details><summary>Using the Docker image from the Container Registry</summary>
>
> This [GitHub workflow](.github/workflows/build-push-docker-image.yaml)
> automatically builds and pushes the Docker image to GitHub's Container Registry
> when the `Dockerfile` file is modified.
>
> 1. Pull the Docker image:
> ```bash
> docker pull ghcr.io/popets-aec/example-docker-c:main
> ```
> 2. Launch the Docker container, attach the current working directory (i.e.,
> run from the root of the cloned git repository) as a volume, set the context
> to be that volume, and provide an interactive bash terminal:
> ```bash
> docker run --rm -it -v ${PWD}:/workspaces/example-docker-c \
>     -w /workspaces/example-docker-c \
>     --entrypoint bash ghcr.io/popets-aec/example-docker-c:main
> ```
> 3. Execute the example script:
> ```bash
> ./test.sh
> ```
> </details>


> <details><summary>Using a locally built Docker image</summary>
>
> 1. Build the Docker image:
> ```bash
> docker build -t example-docker-c:main .
> ```
> 2. Launch the Docker container, attach the current working directory (i.e.,
> run from the root of the cloned git repository) as a volume, set the context
> to be that volume, and provide an interactive bash terminal:
> ```bash
> docker run --rm -it -v ${PWD}:/workspaces/example-docker-c \
>     -w /workspaces/example-docker-c \
>     --entrypoint bash example-docker-c:main
> ```
> 3. Execute the example script:
> ```bash
> ./test.sh
> ```
> </details>

## ToDos if you reuse this template as starter

Make this repository yours:

- [ ] Edit the [`LICENSE`](./LICENSE) to fit your needs.
- [ ] Edit packages to install under [`Dockerfile`](./Dockerfile).
- [ ] Edit the trigger condition for the [GitHub Action
  workflow](./github/workflows/build-push-docker-image.yaml) as needed.
- [ ] Edit documentation in this `README.md` as needed.
- [ ] Add your code and other scripts, modify Makefile, etc.
- [ ] If you have trouble with permissions on files created inside/outside the
  Docker container when accessed from outside/inside it, see the note about UID
  and GID in the [`Dockerfile`](./Dockerfile).
