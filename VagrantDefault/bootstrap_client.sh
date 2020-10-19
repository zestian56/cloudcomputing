mkdir /vagrant/linux_shell_test
cd	/vagrant/linux_shell_test
rm -r temp
mkdir	temp
mkdir	temp/stuff
mkdir	temp/stuff/things
mkdir	-p	temp/stuff/things/orange/apple/pear/grape
touch temp/iamcool.txt
cp temp/iamcool.txt temp/neat.txt
cp temp/neat.txt temp/awesome.txt
cp temp/awesome.txt temp/thefourthfile.txt
mkdir temp/something
cp temp/awesome.txt temp/something
cp	-r	temp/something	temp/newplace
mv	temp/awesome.txt temp/uncool.txt
mv	temp/newplace	temp/oldplace
mv	temp/oldplace	temp/newplace
rm	temp/uncool.txt
rm	temp/iamcool.txt temp/neat.txt temp/thefourthfile.txt
export PATH="$HOME/.local/bin:$PATH"