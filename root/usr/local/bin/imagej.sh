#!/bin/bash

# ToDo: Gigure out a good way to set the memory for java dynamically by what
# is available in the pod.
/app/ImageJ/jre/bin/java -Xmx512m -jar /app/ImageJ/ij.jar
