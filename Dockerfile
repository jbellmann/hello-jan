FROM zalando/openjdk:8u66-b17-1-2

MAINTAINER Jan Löffler <jan.loeffler@zalando.de>

RUN mkdir -p /newrelic

ADD scm-source.json /scm-source.json
ADD newrelic/newrelic.jar /newrelic/newrelic.jar
ADD newrelic/newrelic.yml /newrelic/newrelic.yml
ADD target/hello-jan.jar /hello-jan.jar

EXPOSE 8080

CMD java $(java-dynamic-memory-opts) -javaagent:/newrelic/newrelic.jar -jar /hello-jan.jar
