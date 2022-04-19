case ${SSH_CLIENT:+x} in x)
	export PATH=/usr/bin/ssh-client:${PATH}
esac
