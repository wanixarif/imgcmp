#Installing opencv with non free libs:

Needs to be built from source in order to use the non-free algorithms:


Clone the required repositories(in your home directory, do "```cd ~```" to go to home directory):

Initialize a build directory:
```mkdir opencvbuild```

Clone OpenCV

```git clone https://github.com/opencv/opencv```

Clone OpenCV-Contrib

```git clone https://github.com/opencv/opencv_contrib```


Go to the opencv folder

```cd opencv```

Now set the cmake flags as required, in our case we enable non-free and install the extra modules from opencv-contrib

```
cmake   -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
        -D BUILD_opencv_python2=OFF \
        -D BUILD_opencv_python3=ON \
        -D OPENCV_ENABLE_NONFREE=ON  \
        -D BUILD_EXAMPLES=ON
        -S ./ \
        -B ~/opencvbuild  \
        ..
```

Now set the number of CPU cores the package would build on and start the building process,
higher is better but spare at least 1 or 2 cores from total number of cores

```make -j6``` # the number 6 is the number of CPU cores.

Now to copy the built files to their respective locations do:

```sudo make install```






~~~
Windows (assuming a 64 bit CPU arch):

Download and install cmake, add cmake to PATH variable during installation
```https://github.com/Kitware/CMake/releases/download/v3.18.2/cmake-3.18.2-win64-x64.msi```


Install git-bash. Don't add git to PATH variable during installation
```https://github.com/git-for-windows/git/releases/download/v2.28.0.windows.1/Git-2.28.0-64-bit.exe```

Run git-bash. You observe a command line window. Suppose you want to build opencv and opencv_contrib in c:/lib

In git command line enter following command (if folder does not exist) : 
```
mkdir /c/lib
cd /c/lib
```

Download and copy installOCV.sh script to c:/lib

Run in git command line:
```./installOCV.sh```

 Set the OpenCV environment variable and add it to the systems path 
 ```setx -m OPENCV_DIR D:\OpenCV\Build\x64\vc14```
 ~~~