OS= cat /etc/redhat-release
echo $OS


if [[ -f /etc/redhat-release ]] ; then


echo "OS=redhat"
else
echo "OS=CentOS"
fi
