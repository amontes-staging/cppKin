# Readme

Start Zipking server
-------------------

wget -O zipkin.jar 'https://search.maven.org/remote_content?g=io.zipkin.java&a=zipkin-server&v=LATEST&c=exec'

java -jar zipkin.jar

> examples/bin/example --transport=http --service=commandline_service

Run with Scribe
---------------

SCRIBE_ENABLED=true java -jar zipkin.jar

> examples/bin/example --transport=scribe --service=commandline_service