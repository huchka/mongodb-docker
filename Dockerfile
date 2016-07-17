
# Format: FROM    repository[:version]
FROM	ubuntu:trusty

# Format: MAINTAINER Name <email@addr.ess>
MAINTAINER huchka <huchka@yahoo.com>

# update
RUN apt-get update && apt-get upgrade -y

# installing mongodb

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get install -y mongodb

# Create the MongoDB data directory
RUN mkdir -p /data/db

# Expose port 27017 from the container to the host
EXPOSE 27017

# Set usr/bin/mongod as the dockerized entry-point application
ENTRYPOINT ["/usr/bin/mongod"]

# start mongodb service
# default running port is 27017
# RUN service mongodb start
