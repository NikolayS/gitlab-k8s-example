FROM gitlab/gitlab-runner:v10.2.0
MAINTAINER kaiyadavenport@gmail.com
ADD ./entrypoint.sh /entrypoint.sh
ADD ./config.toml /etc/gitlab-runner/config.toml
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]