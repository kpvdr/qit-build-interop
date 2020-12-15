#!/usr/bin/env python3

import fortworth as _fortworth
import sys

if __name__ == "__main__":
    _fortworth.rpm_install_tag_packages('rh-qpid-proton-dist-el7', 'master', 'tested',
        'qpid-proton', 'qpid-proton-cpp-devel', 'python-qpid-proton')
