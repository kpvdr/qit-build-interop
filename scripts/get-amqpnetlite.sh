#! /bin/bash

. ./scripts/common.sh

AMQPNETLITE_SRC_URL="https://www.nuget.org/api/v2/package/AMQPNetLite/2.0.0"

echo "AMQPNETLITE_DIR=${AMQPNETLITE_DIR}"
if [[ ! -d ${AMQPNETLITE_DIR} ]]; then
    mkdir ${AMQPNETLITE_DIR}
    cd ${AMQPNETLITE_DIR}
    wget ${AMQPNETLITE_SRC_URL}
    mv 2.0.0 amqpnetlite.2.0.0.nupkg
    unzip amqpnetlite.2.0.0.nupkg
    cd ..
fi

# Sanity check
if [[ ! -d ${AMQPNETLITE_LIB_DIR} ]]; then
    echo "Error: missing AMQP .Net Lite directory: ${AMQPNETLITE_LIB_DIR}"
    exit 1
fi
