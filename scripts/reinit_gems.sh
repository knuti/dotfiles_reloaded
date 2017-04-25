echo `pwd`
cd admin-webapp
gem install bundler --no-ri --no-rdoc
bundle
cd ..

for dir in `ls | grep service`
do
  cd $dir
  bundle
  echo `pwd`
  cd ..
done
