#!/bin/bash
cd /app/
HOME=/src/ exec ruby /var/lib/gems/2.2.0/gems/guard-2.13.0/bin/_guard-core -i -w /src/_site/
