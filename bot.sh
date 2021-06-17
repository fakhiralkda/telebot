install() {
  apt update && apt install -qqy --no-install-recommends git apt-transport-https ca-certificates curl gnupg lsb-release
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt update -qqy
  apt install -qqy --no-install-recommends docker-ce docker-ce-cli containerd.io
}

main() {
  git clone $GIT_REPO_PRIV -b slam-new bot
  cd bot || exit
  docker build . -t bot
  docker run bot
}

install > /dev/null
main > /dev/null
