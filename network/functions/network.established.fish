function network.connections -d "network"
    lsof -l -i +L -R -V | grep ESTABLISHED
end