function network.connections -d "network"
    curl -s http://checkip.dyndns.org/ | sed "s/[a-zA-Z<>/ :]//g"
end