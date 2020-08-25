FROM cassandra:3.11.3
MAINTAINER Dekel Barzilay <dekelev@gmail.com>

# Workaround for https://github.com/docker/docker/issues/6345
RUN ln -s -f /bin/true /usr/bin/chfn

# Disable vnodes and gossip to bootstrap faster 
COPY scripts/setup-config.sh /setup-config.sh
RUN sh setup-config.sh

# 7000 : intra-node communication
# 7001 : TLS inrra-node communication
# 7199 : JMX
# 9042 : CQL
# 9160 : thrift service
EXPOSE 7000 7001 7199 9042 9160
