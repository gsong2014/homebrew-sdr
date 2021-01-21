# homebrew-sdr
This repository is a collection of **Homebrew** formulas and directions to install various SDR software components.  After much pain and suffering always trying to get thing installed properly I started using **Homebrew** which has really simplified the process.  Certainly each install will be different, but I hope this provides a good foundation to get up and running with your SDR.

Currently, there are formulas for:
  - Python
  - GNU Radio 3.7.10
  - rtlsdr
  - gr-osmosdr
  - GQRX 2.3.2
  - gr-gsm

This installation works for macOS Sierra 10.12.3.

### Install XCode
You'll need to install [Xcode](https://developer.apple.com/xcode/downloads/) and the ```Commandline Tools``` first.  This installation was successful with Xcode 8.

```shell
xcode-select --install
softwareupdate --install --all 
```

### Install Homebrew

```shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install Python

```shell
brew install python
brew cask install xquartz

brew tap homebrew/python
brew install matplotlib
brew install numpy
brew install scipy
brew install sphinx

# Dependencies
pip install Cheetah
pip install lxml
pip install sphinx
pip install Pillow    # required for running the heatmap.py script
```

### Install Dependencies

```
brew install gsl
brew install pygtk
brew install wxpython
brew install boost
brew install cppunit
brew install fftw
brew install zeromq
brew install doxygen
brew install uhd
brew install portaudio
brew install sdl
brew install jack
brew install swig
brew install sip
```

### Install GNU Radio

Installing GNU Radio usually takes about 25 mins.  The formula will make sure all dependencies are met.

```shell
brew tap gsong2014/homebrew-sdr
brew install cmake   # install cmake-3.3.2 since gnuradio doesnt like newer versions

# version 3.7.10
brew install gnuradio
```

### Install SDR Tools

I'm using the RTLSDR dongle.  For other SDR devices, install the desired driver before installing ```gr-osmosdr``` and ```gqrx```.  Check [this page](http://sdr.osmocom.org/trac/wiki/GrOsmoSDR) for more information. 

```shell
brew install librtlsdr 
brew install bladerf --HEAD
brew install gr-osmosdr gr-baz --HEAD
brew install gqrx
```

### Install gr-gsm

```
brew install libosmocore --HEAD
brew install gr-gsm --HEAD
```

### SDR Testing

#### GQRX
Navigate to the Applications folder and launch GQRX.  The application should launch and you should be able to see click the power button on the top left side of the interface to start.  Then begin playing with all of the buttons.

#### RTL_Power
After installing the rtlsdr library, there are several python scripts that you can begin to use.  The easiest one to use is the ```rtl_power``` located in ```/usr/local/bin```.  [This blog](http://kmkeen.com/rtl-power/) give a good overview of specifics.  Here is an example:

```shell
rtl_power -f 90M:120M:8k -g 50 -i 2 -e 1h data.csv
```

The ```-f``` command specifies a range of frequencies to scan(lower:upper:bin size).  ```-i``` sets the collection time in seconds/minutes/hour(s/m/h) format.  ```-e``` sets the run time(though you can always use ```ctl-c``` to exit).  And then give a file to save data to.

After recording data, use the ```heatmap.py``` file to generate an high resolution image of the spectrum.  It looks something like this:

```shell
python heatmap.py input.csv output_file.png
```

## LimeSDR

This setup works on my machine. YMMV...

	brew install nlohmann-json pygtk
	pip2 install six
	brew install pygobject3 gtk+3

    brew install -d -v --build-from-source --with-python2 soapysdr
    brew install -d -v --build-from-source --with-images limesuite
    brew install -d -v --build-from-source --HEAD gsong2014/sdr/volk
    brew install -d -v --build-from-source --HEAD gsong2014/sdr/pothos-lime
    brew install -d -v --build-from-source --HEAD gsong2014/sdr/gnuradio
    brew install -d -v --build-from-source librtlsdr
    brew install -d -v --build-from-source --HEAD gsong2014/sdr/gr-fcdproplus
    brew install -d -v --build-from-source --HEAD gsong2014/sdr/gr-osmosdr
    brew install -d -v --build-from-source gsong2014/sdr/gr-limesdr
    
 

Do not forget to define the path to the gnuradio-companion blocks:

    export GRC_BLOCKS_PATH=$(ls -d /usr/local/opt/*/share/gnuradio/grc/blocks | tr '$\n' :)
