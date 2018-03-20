# wishful-container

## Running container

Agent:

    $ docker run -it -e TYPE=agent vesnatools


Controller:

    $ docker run -it -p 8990:8990 -p 8989:8989  -e TYPE=controller vesnatools
