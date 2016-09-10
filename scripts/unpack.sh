#!/bin/bash
mkdir $1".unpack"
echo "Unpacking "$1"..."
./v8unpack -unpack $1 $1".unpack/"
for i in $( ls $1".unpack/"*.data ); do
  echo "Inflating "$i"..."
  ./v8unpack -inflate $i $i".inf"
done
for i in $( ls $1".unpack/"*.inf ); do
  echo "Parsing "$i"..."
  mkdir $i".content"
  ./v8unpack -unpack $i $i".content/"
done
