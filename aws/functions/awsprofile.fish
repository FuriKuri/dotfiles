function awsprofile -d "awsprofile <profile-name>"
    set profile $argv[1]
    if not set -q profile
        echo "missing profile name"
    else
        export AWS_DEFAULT_PROFILE=$profile
        export AWS_PROFILE=$profile
    end
end