
FROM perl:latest

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Starman

RUN cachebuster=907bdf2 git clone https://github.com/shotlom/strat-dat.git
RUN cd towncrier && carton install --deployment

EXPOSE 8080

WORKDIR strat-dat
CMD carton exec starman --port 8080 bin/app.pl
