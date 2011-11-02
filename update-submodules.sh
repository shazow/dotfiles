#!/bin/bash
git submodule foreach --recursive git pull origin master
git submodule update --recursive
