#!/bin/bash
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
