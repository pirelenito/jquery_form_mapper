#!/bin/bash
rm -rf dist/
rm -rf spec.js/

coffee -b -o dist/ -c src/
coffee -b -o spec.js/ -c spec/