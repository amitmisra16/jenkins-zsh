
local jenkins_url
if [[ -f .jenkins-url ]]; then
  jenkins_url=$(cat .jenkins-url)
elif [[ -f ~/.jenkins-url ]]; then
  jenkins_url=$(cat ~/.jenkins-url)
elif [[ -n "${JENKINS_URL}" ]]; then
  jenkins_url=${JENKINS_URL}
else
  _jenkins_url_help
  return 1
fi

export JENKINS_URL=${jenkins_url}

function _jenkins_url_help() {
cat << EOF
error: JENKINS URL is not specified anywhere.

Valid options, in order of precedence:
.jenkins-url file
\$HOME/.jenkins-url file
\$JENKINS_URL environment variable
EOF
}
