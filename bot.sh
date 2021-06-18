main() {
  sudo apt update && sudo apt install -y -q --no-install-recommends git
  git clone $GIT_REPO_PRIV -b slam-new bot
  cd bot || exit
  sed -i 's/level\=logging\.INFO/level\=logging\.CRITICAL/g' bot/__init__.py
  sudo apt -y clean && sudo apt -y autoremove
  sudo rm -rf /var/lib/apt/lists
  sudo rm -rf /var/cache/apt/archives
  docker build . -t bot
  docker run bot
}

main > /dev/null
