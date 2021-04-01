FROM spark-base

# -- Runtime
ARG user=thusitha
ARG group=thusitha
ARG uid=1000
ARG gid=1000

ARG spark_master_web_ui=8080

EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}

RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${group} -s /bin/bash ${user}
RUN mkdir /home/${user}
RUN chown ${user} /home/${user}
RUN chown -R ${user} logs/

USER ${user}:${gid}
CMD bin/spark-class org.apache.spark.deploy.master.Master  >> logs/spark-master.out