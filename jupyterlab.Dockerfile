FROM cluster-base

ARG user=thusitha
ARG group=thusitha
ARG uid=1000
ARG gid=1000

# -- Layer: JupyterLab
# extra installations?
# -- Runtime

EXPOSE 8888
WORKDIR ${SHARED_WORKSPACE}


RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${group} -s /bin/bash ${user}
RUN mkdir /home/${user}
RUN chown ${user} /home/${user}
USER ${user}:${gid}

CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=abc123