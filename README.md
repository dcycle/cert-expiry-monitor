Cert Expiry Monitor
-----

[![CircleCI](https://circleci.com/gh/dcycle/cert-expiry-monitor.svg?style=svg)](https://circleci.com/gh/dcycle/cert-expiry-monitor)


Monitor websites for expiring SSL certificates.

Typical usage to check whether one of several domain names will expire in less than 170 days, for example:

    $ ./cem.sh check --sites="amazon.com;apple.com" --days=170
              _______ _______  ______ _______
              |       |______ |_____/    |
              |_____  |______ |    \_    |
        _______ _     _  _____  _____  ______ __   __
        |______  \___/  |_____]   |   |_____/   \_/
        |______ _/   \_ |       __|__ |    \_    |   
    _______  _____  __   _ _____ _______  _____   ______
    |  |  | |     | | \  |   |      |    |     | |_____/
    |  |  | |_____| |  \_| __|__    |    |_____| |    \_
    amazon.com;apple.com
    amazon.com expires in 334 days, on Feb 23 12:00:00 2021 GMT
    apple.com expires in 116 days, on Jul 20 12:00:00 2020 GMT
     =>
     => Some sites expire in less than 170 days:
       => apple.com expires in 116 days
     =>

Type ./cem.sh usage for more details.

Built with [dcBase](https://github.com/dcycle/dcbase).
