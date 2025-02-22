# Load the SSH keychain once
if status is-login; and status is-interactive; and test (uname) = Linux
    # Define SSH keys
    set SSH_PRIVATE_KEYS \
        ~/.ssh/id_rsa

    # Define GPG key identifiers
    set GPG_PRIVATE_KEYS

    SHELL=fish keychain --agents "gpg,ssh" --quiet --eval $SSH_PRIVATE_KEYS $GPG_PRIVATE_KEYS \
        | source
end
