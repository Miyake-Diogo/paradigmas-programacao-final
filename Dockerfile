FROM haskell:latest

WORKDIR /opt/paradigmas-programacao-final

RUN cabal update

# Add just the .cabal file to capture dependencies
COPY ./paradigmas-programacao-final.cabal /opt/paradigmas-programacao-final/paradigmas-programacao-final.cabal

# Docker will cache this command as a layer, freeing us up to
# modify source code without re-installing dependencies
# (unless the .cabal file changes!)
RUN cabal build --only-dependencies -j4

# Add and Install Application Code
COPY . /opt/paradigmas-programacao-final
RUN cabal install

CMD ["stack", "test"]