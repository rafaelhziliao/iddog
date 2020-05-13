xcodeproj_path='./iddog.xcodeproj'
precommit_path='.git/hooks/pre-commit'

echo ""
echo "#########################"
echo "# Bundler Configuration #"
echo "#########################"
echo ""
sudo gem install bundler
bundle install
bundle update

echo ""
echo "#########################"
echo "# Homebrew Configuration #"
echo "#########################"
echo ""
echo -ne '\n' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install swiftlint

echo ""
echo "##################################"
echo "# Python and Xunique Instalation #"
echo "##################################"
echo ""
brew install python
python3 -c "import ssl; print(ssl.OPENSSL_VERSION)"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
pip3 install --upgrade pip
pip3 install --ignore-installed six --user
pip3 install -r pip-requirements.txt --user
{ echo '#!/bin/sh'; echo 'xunique -u -s -p '$xcodeproj_path; } > $precommit_path
chmod 755 $precommit_path
rm -rf get-pip.py

echo ""
echo "##########################"
echo "# Cocoapods Instalation #"
echo "##########################"
echo ""
bundle exec pod install
