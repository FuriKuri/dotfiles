function cdf -d "cdf"
    set cmd (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
    cd $cmd
end