## Fast startup Cassandra docker 

[Apache Cassandra] is an open-source distributed storage system.

We often use an embedded single node cassandra for running integration tests , but the official image of cassandra takes around 30 seconds to start.

I try to decrease this time by tuning some cassandra configuration:
- Disabling vnodes, we don't need to customize the token for testing purposes and beside we often use a single cassandra container for that (~10 sec).
- Disable gossip at start-up, like below don't need that in a single node cassandra cluster (another ~10 sec).

With this image, the startup decrease by 2 to 3 time less than the original, depending on the cassandra version.

## Usage

Like the official image, starting a cassandra instance is simple :
```sh
docker run --name container-name -d dekelev/cassandra:tag

# Disable vnodes & gossip
docker run --name container-name -d dekelev/cassandra:3.11.3

# Disable vnodes
docker run --name container-name -d dekelev/cassandra:3.11.3-cluster

# Disable gossip
docker run --name container-name -d dekelev/cassandra:3.11.3-single
```
\
In fact you can use this image in place of the official, it works exactly the same , because it was build from the cassandra official image. 
So if you want to handle connectivity (like trying to connect from another containerized application or from  ```cqlsh```), variable environments or the volume where you used to store data... no need to change anything, all configurations are the same.
(See [cassandra] official for more advanced settings and recommendations). 

## Note
The tags are the same as in the official image, so you can just switch easily to this image and that's it, it should work out of the box.


[cassandra]: <https://hub.docker.com/_/cassandra/>
[Apache Cassandra]: <http://cassandra.apache.org/>
