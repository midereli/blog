#!/bin/sh

rm -rf public/*
hugo
aws s3 sync public s3://blog.merihdereli.com/ --profile merih --delete
