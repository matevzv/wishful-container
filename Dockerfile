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
git clone https://github.com/wishful-project/module_discovery.git && \
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

RUN apt-get install -y python3-pip python3-zmq python3-gevent python3-numpy python3-lxml

RUN pip3 install --upgrade setuptools
RUN pip3 install docopt pyyaml

RUN pip3 install agent/ controller/ framework/ pyre/ module_discovery/ \
module_discovery_pyre/ module_iperf/ python-tc/ wishful_upis/ module_simple/ \
wishful-module-ismtv/ wishful-module-6lowpan/ wishful-module-lora/ \
wishful-module-uwb/

COPY docker/start.sh /root

ENTRYPOINT ["/root/start.sh"]
