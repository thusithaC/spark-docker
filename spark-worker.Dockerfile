FROM spark-base

# -- Runtime
ARG user=thusitha
ARG group=thusitha
ARG uid=1000
ARG gid=1000

ARG spark_worker_web_ui=8081

EXPOSE ${spark_worker_web_ui}


RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${group} -s /bin/bash ${user}
RUN mkdir /home/${user}
RUN chown ${user} /home/${user}
RUN chown -R ${user} logs/
USER ${user}:${gid}

CMD bin/spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT}  >> logs/spark-worker.out