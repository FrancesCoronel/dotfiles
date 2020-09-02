#!/bin/sh


find . -name '*.so' | xargs xattr -d -r com.apple.quarantine
