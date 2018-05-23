# jupyter-template

> A template for creating a jupyter notebook in docker

## Requirements

- Docker version 18.05.0-ce, build f150324782 or higher
- Python 2.7+


# Usage

Contains a single `go.sh` script that can build the docker image and start it.  To build and start the image use:

    ./go.sh build

This will create a new image named "notebook".  It will also start an instance of the image (also named notebook).  It will map the directory where the `go.sh` script is executed to the instance directory `/notebook`.  All of the notebook files in this directory will be served by the instance.  When the instance starts it will print out information on a "token" that is needed to log into the instance.  The token information looks like:

    waiting for jupyter notebook startup
    [I 04:52:18.541 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
    [I 04:52:18.729 NotebookApp] Serving notebooks from local directory: /tmp
    [I 04:52:18.729 NotebookApp] 0 active kernels
    [I 04:52:18.729 NotebookApp] The Jupyter Notebook is running at:
    [I 04:52:18.729 NotebookApp] http://devhaus:8888/?token=99927f0000000000000000000079f310dbc3bb3bde0f687d
    [I 04:52:18.729 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
    [C 04:52:18.729 NotebookApp]

If running the script a second time then leave off the build option to just start the existing image (assuming a container is not running):

    ./go.sh

To see if the notebook server is up use:

    docker ps | grep notebook

To view the logs:

    docker logs notebook

To stop the notebook server instance:

    docker stop notebook


# References

1. http://jupyter-notebook.readthedocs.io/en/stable/index.html
2. https://docs.docker.com/engine/reference/builder/
3. https://docs.docker.com/engine/reference/commandline/docker/
