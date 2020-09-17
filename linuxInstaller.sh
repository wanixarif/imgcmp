echo "Opencv and OpenCV-contrib Installer, created by Arif Wani"
sleep 2
cd ~
if [  ! -d "opencv"  ]; then
    echo "cloning opencv"
    git clone https://github.com/opencv/opencv.git
    echo DONE
else
    echo opencv source already downloaded
fi

if [  ! -d "opencv_contrib"  ]; then
    echo "cloning opencv contrib"
    git clone https://github.com/opencv/opencv_contrib
    echo DONE

else
    echo "opencv contrib source already downloaded"
fi

if [  ! -d "opencvbuild"  ]; then
    echo "creating build directory"
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

echo "Installation complete"
