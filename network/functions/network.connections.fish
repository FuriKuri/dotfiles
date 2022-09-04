function network.connections -d "network"
    lsof -l -i +L -R -V
end