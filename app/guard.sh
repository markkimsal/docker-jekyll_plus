#!/bin/bash
cd /app/
HOME=/src/ exec ruby /usr/local/bin/_guard-core -i -w /src/_site/
