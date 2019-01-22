#!/bin/bash

if [ "$ENVIRONMENT" = "development" ]; then
  echo "development build" && \
  go build . && ./jide
else
  echo "production run" && \
  ./jide
fi
