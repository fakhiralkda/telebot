install() {
  sudo apt update -qq -y && sudo apt install -y -qq --no-install-recommends git
  sudo -EH aptt -qq -y purge \
  ${APT_Pac4Purge} \
  adoptopenjdk-* openjdk* ant* \
  *-icon-theme plymouth *-theme* fonts-* gsfonts gtk-update-icon-cache \
  google-cloud-sdk \
  apache2* nginx msodbcsql* mssql-tools mysql* libmysqlclient* unixodbc-dev postgresql* libpq-dev odbcinst* mongodb-* sphinxsearch \
  apport* popularity-contest \
  aspnetcore-* dotnet* \
  azure-cli session-manager-plugin \
  brltty byobu htop \
  buildah hhvm kubectl packagekit* podman podman-plugins skopeo \
  chromium-browser firebird* firefox google-chrome* xvfb \
  esl-erlang ghc-* groff-base rake r-base* r-cran-* r-doc-* r-recommended ruby* swig* \
  gfortran* \
  gh subversion mercurial mercurial-common \
  info install-info landscape-common \
  libpython2* imagemagick* libmagic* vim vim-* \
  man-db manpages \
  mono-* mono* libmono-* \
  nuget packages-microsoft-prod snapd yarn \
  php-* php5* php7* php8* snmp \
  alsa-topology-conf alsa-ucm-conf python2-dev python2-minimal libpython-dev clang-9 clang-format-9 llvm-10-dev llvm-10-runtime \
  llvm-10-tools llvm-10 lld-10 lld-9 libllvm10 libllvm9 libclang-common-10-dev libclang-cpp10 libclang1-10 clang-10 clang-format-10 \
  &>/dev/null
  curl -sL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh -o uninstall-brew.sh && chmod a+x uninstall-brew.sh
  ./uninstall-brew.sh -f -q &>/dev/null
  sudo rm -rf -- ./uninstall-brew.sh /home/linuxbrew &>/dev/null
}

main() {
  git clone $GIT_REPO_PRIV -b slam-new bot
  cd bot || exit
  sed -i 's/level\=logging\.INFO/level\=logging\.ERROR/g' bot/__init__.py
  sudo apt -y clean && sudo apt -y autoremove
  sudo rm -rf /var/lib/apt/lists
  sudo rm -rf /var/cache/apt/archives
  docker build . -t bot
  docker run bot
}

echo "::group::Uninstalling Unnecessary Applications"
install >/dev/null
echo "::endgroup::"
main > /dev/null
