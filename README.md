# TEQC in CentOS Docker

* TEQC - The Toolkit for GPS/GLONASS/Galileo/SBAS/Beidou/QZSS/IRNSS Data 
  + According to [FAQ by UNAVCO](https://www.unavco.org/software/data-processing/teqc/faqs/faqs.html)
    - non-free software (closed source)
    - free to use now (freeware)

* How to use:

```
docker run -it sean0921/teqc /bin/bash
teqc +help
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
