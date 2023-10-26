#!/bin/bash


# All ar4ags are in @
for i in $@
do 
  yum install $i -y
  done 