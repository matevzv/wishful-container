FROM sensorlab6/vesna-tools
MAINTAINER Matevz Vucnik <matevz.vucnik@ijs.si>

LABEL Description="This image is used to bootstrap Wishful UPIs"
LABEL Vendor="JSI"
LABEL Version="1.0"

RUN mkdir -p wishful
WORKDIR /root/wishful

RUN git clone https://github.com/wishful-project/agent.git && \
git clone https://github.com/wishful-project/controller.git && \
git clone https://github.com/wishful-project/examples.git && \
git clone https://github.com/wishful-project/framework.git && \
git clone https://github.com/wishful-project/pyre.git && \
git clone https://github.com/wishful-project/module_discovery_pyre.git && \
git clone https://github.com/wishful-project/module_iperf.git && \
git clone https://github.com/wishful-project/python-tc.git && \
git clone https://github.com/wishful-project/wishful_upis.git && \
git clone https://github.com/wishful-project/module_simple.git && \
git clone https://github.com/wishful-project/wishful-module-ismtv.git && \
git clone https://github.com/wishful-project/wishful-module-6lowpan.git && \
git clone https://github.com/wishful-project/wishful-module-lora.git && \
git clone https://github.com/wishful-project/wishful-module-uwb.git

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && apt-get update

RUN apt-get install -y python3-pip
RUN apt-get install -y python3-zmq
RUN apt-get install -y python3-gevent
RUN apt-get install -y python3-numpy
RUN apt-get install -y python3-lxml

RUN pip3 install docopt
RUN pip3 install pyyaml
RUN pip3 install --upgrade setuptools

RUN cd agent && pip3 install . && \
cd ../controller && pip3 install . \
cd ../framework && pip3 install . \
cd ../pyre && pip3 install . \
cd ../module_discovery_pyre && pip3 install . \
cd ../module_iperf && pip3 install . \
cd ../python-tc && pip3 install . \
cd ../wishful_upis && pip3 install . \
cd ../module_simple && pip3 install . \
cd ../wishful-module-ismtv && pip3 install . \
cd ../wishful-module-6lowpan && pip3 install . \
cd ../wishful-module-lora && pip3 install . \
cd ../wishful-module-uwb && pip3 install .

COPY docker/start.sh /root/wishful

ENTRYPOINT ["/root/wishful/start.sh"]