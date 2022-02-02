# TEQC & runprk00 in CentOS Docker

#### Edited by M.R. Siegfried (siegfried@mines.edu) 2 Feb 2022

Annoyed that `runpkr00` doesn't work on 64-bit machines or Apple Silicon? This is for you. This let's you build and launch a Docker image that has `teqc` and `runpkr00` installed, along with a shell script `trim2dat_folder.sh` that will run `runpkr00` on all `.dat` files in the folder you currently reside. I will keep adding helper shell scripts as I have time (or send a pull request with new scripts. I will at some point test this for _offline_ use to make sure we can keep using this while we are in Antarctica. Thanks to Kiya Riverman for making me get off my butt to deal with a `runprk00` solution (and of course thanks to the four-year-ago insight of sean0921 to build this Dockerfile, from where I forked the initial code)

* TEQC - The Toolkit for GPS/GLONASS/Galileo/SBAS/Beidou/QZSS/IRNSS Data 
  + According to [FAQ by UNAVCO](https://www.unavco.org/software/data-processing/teqc/faqs/faqs.html)
    - non-free software (closed source)
    - free to use now (freeware)

* How to use:

```sh
docker run -it sean0921/teqc /bin/bash
teqc +help      #test teqc command
runpkr00        #test runpkr00 command
man runpkr00    #you can see manual of runpkr00 if you need
```

if output help message shows, you can use it!

* If you want to save the data, try to use `-v` option after docker command, to add use docker volume feature.

* Execute Environment in Docker:
  + CentOS 6.10
  + You can change the Dockerfile to test in different environment

* Running Dependencies Information:

```
$ ldd teqc
linux-vdso.so.1 =>  
libm.so.6 => /lib64/libm.so.6 
librt.so.1 => /lib64/librt.so.1 
libc.so.6 => /lib64/libc.so.6 
libpthread.so.0 => /lib64/libpthread.so.0 
/lib64/ld-linux-x86-64.so.2 
```

* All rights reserved to origin developer, I don't have any copyrights of executables.
