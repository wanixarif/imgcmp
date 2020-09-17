echo "Opencv and OpenCV-contrib Installer, created by Arif Wani"
sleep 2
cd ~
 echo "cloning opencv"
if [  ! -d "opencv"  ]; then
    git clone https://github.com/opencv/opencv.git
    echo DONE
else
    echo opencv source already downloaded
fi


echo "cloning opencv contrib"
if [  ! -d "opencv_contrib"  ]; then
    git clone https://github.com/opencv/opencv_contrib
    echo DONE

else
    echo "opencv contrib source already downloaded"
fi


echo "creating build directory"
if [  ! -d "opencvbuild"  ]; then
    mkdir opencvbuild

else
    echo "Build directory exists, recreating"
    rm -rf opencvbuild/*
fi


cd opencv

echo "STARTING CMAKE"

rm ~/opencv/CMakeCache.txt

cmake   -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
        -D BUILD_opencv_python2=OFF \
        -D BUILD_opencv_python3=ON \
        -D OPENCV_ENABLE_NONFREE=ON  \
        -D BUILD_EXAMPLES=ON -S ~/opencv -B ~/opencvbuild ..

echo "cmake compilation DONE"

cd ~/opencvbuild

echo "make the generated build files"
make -j6

echo "installing to /usr/local , requires superuser access"

sudo make install

echo "INSTALLATION COMPLETE"

sleep 2
