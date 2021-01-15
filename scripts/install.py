#!/usr/bin/env python3

import fortworth as _fortworth

if __name__ == "__main__":
    _fortworth.rpm_install_tag_packages('rh-qpid-proton-dist-el8', 'master', 'tested',
                                        'qpid-proton-cpp-devel',
                                        'python3-qpid-proton')
