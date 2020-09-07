#Installing opencv with non free libs:

Needs to be built from source in order to use the non-free algorithms:


Clone the required repositories(in your home directory, do "```cd ~```" to go to home directory):

OpenCV

```git clone https://github.com/opencv/opencv```

OpenCV-Contrib

```git clone https://github.com/opencv/opencv_contrib```


Go to the opencv folder

```cd opencv```

Now set the cmake flags as required, in our case we enable non-free and install the extra modules from opencv-contrib

```
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \

    #to run it in a conda virtual environment, haven't tried myself yet

    -D PYTHON3_LIBRARY=$CONDA_HOME/envs/cv/lib/libpython3.7m.dylib \ 
    -D PYTHON3_INCLUDE_DIR=$CONDA_HOME/envs/cv/include/python3.7m \
    -D PYTHON3_EXECUTABLE=$CONDA_HOME/envs/cv/bin/python \
    -D PYTHON3_PACKAGES_PATH=$CONDA_HOME/envs/cv/lib/python3.7/site-packages \

    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \

    # this enables SIFT, SURF and other non free algorithms
    -D OPENCV_ENABLE_NONFREE=ON \

    #Comes with some examples, haven't tried myself yet
    -D BUILD_EXAMPLES=ON ..    # yes the dots are real
```

Now set the number of CPU cores the package would build on and start the building process,
higher is better but spare at least 1 or 2 cores from total number of cores

```make -j6``` # the number 6 is the number of CPU cores.

Now to copy the built files to their respective locations do:

```sudo make install```