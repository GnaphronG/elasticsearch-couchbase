## What is Elasticsearch?
Elasticsearch is a search server based on Lucene. It provides a distributed, multitenant-capable full-text search engine with a RESTful web interface and schema-free JSON documents.

Elasticsearch is a registered trademark of Elasticsearch BV.

wikipedia.org/wiki/Elasticsearch



## How to use this image
The default couchbase plugin credentials are :
- Username: Administrator
- Password: Administrator

You can run the default elasticsearch command simply:

```
$ docker run -d elasticsearch -e "ES_COUCHBASE_USERNAME=Administrator" -e "ES_COUCHBASE_PASSWORD=Administrator" 
```
You can also pass in additional flags to elasticsearch:

```
$ docker run -d elasticsearch -Des.node.name="TestNode "
```
This image comes with a default set of configuration files for elasticsearch, but if you want to provide your own set of configuration files, you can do so via a volume mounted at `/usr/share/elasticsearch/config`:

```
$ docker run -d -v "$PWD/config":/usr/share/elasticsearch/config elasticsearch
```
This image is configured with a volume at `/usr/share/elasticsearch/data` to hold the persisted index data. Use that path if you would like to keep the data in a mounted volume:

```
$ docker run -d -v "$PWD/esdata":/usr/share/elasticsearch/data elasticsearch
```
This image includes `EXPOSE 9200 9300 (default http.port)`, so standard container linking will make it automatically available to the linked containers.

## License
View license information for the software contained in this image.

## Supported Docker versions
This image is officially supported on Docker version 1.12.1.

Please see the Docker installation documentation for details on how to upgrade your Docker daemon.
