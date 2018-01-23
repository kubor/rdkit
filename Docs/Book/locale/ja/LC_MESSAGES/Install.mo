��    C      4              L  9   M  -   �     �  Z   �  J   /     z  0   �  W   �          $     B  �  \  �   �  �   d  |   		  ?   �	  �   �	  T   H
  �   �
  {   �       +      "  L  �   o  J   "  �   m      @   8  -   y  )   �  d   �  d   6  �   �  +   Z  b   �  �   �  W   �  B   �  >   3     r  
   {  *   �  	   �  F   �  �     g   �  _     �   r  P  �  �   M  �     {   �  b     x   u  8   �  e   '    �    �  �   �     M  4   `  8   �  ;   �  J   
  y   U  *   �  {  �  9   v!  -   �!     �!  Z   �!  J   X"     �"  0   �"  W   �"     D#     M#     k#  �  �#  �   %  �   �%  |   2&  ?   �&  �   �&  T   q'  �   �'  {   �(     +)  +   I)  "  u)  �   �*  J   K+  �   �+    D,  @   a-  -   �-  )   �-  d   �-  d   _.  �   �.  +   �/  b   �/  �   0  W   �0  B   1  >   \1     �1  
   �1  *   �1  	   �1  F   �1  �   +2  g   �2  _   ;3  �   �3  P  %4  �   v5  �   +6  {   �6  b   ;7  x   �7  8   8  e   P8    �8    �9  �   �:     v;  4   �;  8   �;  ;   �;  J   3<  y   ~<  *   �<   $ cd [anaconda folder]/bin $ source activate my-rdkit-env $ conda create -c rdkit -n my-rdkit-env rdkit $ source activate my-rdkit-env Add #define BOOST_PYTHON_NO_PY_SIGNATURES at the top of Code/GraphMol/Wrap/EditableMol.cpp Add this to the arguments when you call cmake: -DBoost_USE_STATIC_LIBS=OFF Additional Requirements Be sure that the new numpy is used in the build: Below a number of installation recipes is presented, with varying degree of complexity. Building Building on OS X with XCode 4 C:> activate my-rdkit-env Conda is an open-source, cross-platform, software package manager. It supports the packaging and distribution of software components, and manages their installation inside isolated execution environments. It has several analogies with pip and virtualenv, but it is designed to be more "python-agnostic" and more suitable for the distribution of binary packages and their dependencies. Creating a new conda environment with the RDKit installed using these  packages requires one single command similar to the following:: Due to the conda python distribution being a different version to the system python, it is easiest to install PostgreSQL and the PostgreSQL python client via conda. Eddie Cao has produced a homebrew formula that can be used to easily build the RDKit https://github.com/rdkit/homebrew-rdkit Fetch the source, here as tar.gz but you could use git as well: Finally, the new environment must be activated, so that the corresponding python interpreter becomes available in the same shell: For more details on building from source with Conda, see the conda-rdkit repository. For most use cases you will instead need to run PostgreSQL as a daemon, one way to do this is using supervisor. You can find out more and how to install supervisor here. The required configuration file will look something like this: Here things are more difficult. Check this wiki page for information: https://code.google.com/p/rdkit/wiki/BuildingOnCentOS Here's a sample command line: If for some reason this does not work, try: If you are trying to use multiple installations of PostgreSQL in different environments, you will need to setup different pid files, unix sockets and ports by editing the PostgreSQL config files. With the above configurations these files can be found in /folder/where/data/should/be/stored. If you aren't using the default python installation for your computer, You need to tell cmake where to find the python library it should link against and the python header files. If you have put boost in /opt/local, the cmake invocation would look like: If your linux distribution has a boost-devel package including the python, regex, threading, and serialization libraries, you can use that and save yourself the steps below. In Win7 systems, you may run into trouble due to missing DLLs, see one thread from the mailing list: http://www.mail-archive.com/rdkit-discuss@lists.sourceforge.net/msg01632.html You can download the missing DLLs from here: http://www.microsoft.com/en-us/download/details.aspx?id=5555 In each case I've replaced specific pieces of the path with .... Install the following packages using apt-get: Install the following packages using yum: More information here: http://www.mail-archive.com/rdkit-discuss@lists.sourceforge.net/msg01119.html More information here: http://www.mail-archive.com/rdkit-discuss@lists.sourceforge.net/msg01178.html Note that if you are using your own boost install on a system with a system install, it's normally a good idea to also include the argument -D Boost_NO_SYSTEM_PATHS=ON in your cmake command. Now it's safe to build boost and the RDKit. Once "make" and "make install" completed successfully, use the following command to run the tests: Once PostgreSQL is up and running, all of the normal PostgreSQL commands can then be run when your conda environment is activated. Therefore to create a database you can run: Optionally, add the following packages to your environment as useful development tools. Packages to install from source (not required on RHEL/CentOS 6.x): PostgreSQL can then be run from the terminal with the command: Problem: Problem: : See below for a list of FAQ and solutions. Solution: Solution: Get a copy of numpy and build it like this as root: as root: Thanks to Gianluca Sforna's work, binary RPMs for the RDKit are now part of the official Fedora repositories: https://admin.fedoraproject.org/pkgdb/package/rpms/rdkit/ Thanks to the efforts of the Debichem team, RDKit is available via the Ubuntu repositories. To install: The PYTHON_EXECUTABLE part is optional if the correct python is the first version in your PATH. The conda packages PostgreSQL version needs to be initialized by running the initdb command found in [conda folder]/envs/my-rdkit-env/bin The easiest way to get Conda is having it installed as part of the Anaconda Python distribution. A possible (but a bit more complex to use) alternative is provided with the smaller and more self-contained Miniconda. The conda source code repository is available on github and additional documentation is provided by the project website. The following commands will create a development environment for macOS Sierra and Python 3. Download Miniconda3-latest-MacOSX-x86_64.sh from Conda and run these following commands: The intent of this license is similar to that of the RDKit itself. In simple words: "Do whatever you want with it, but please give us some credit." The problem seems to be caused by the version of numpy that is distributed with XCode 4, so you need to build a fresh copy. Then follow the usual build instructions. The PYTHON_INCLUDE_DIR must be set in the cmake command. This can be solved by using cmake version 2.8.3 (or more recent) and providing the -D Boost_NO_SYSTEM_PATHS=ON argument: This document is copyright (C) 2012-2016 by Greg Landrum This is required due to the System Integrity Protection SIP introduced in more recent macOS versions. This section assumes that python is installed in C:\Python27, that the boost libraries have been installed to C:\boost, and that you will build the RDKit from a directory named C:\RDKit. If any of these conditions is not true, just change the corresponding paths. This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative Commons, 543 Howard Street, 5th Floor, San Francisco, California, 94105, USA. To use the wrappers, the three files need to be in the same directory, and that should be on your CLASSPATH and in the java.library.path. An example using jython: Using the wrappers Windows users will use a slightly different command: With your environment activated, this is done simply by: You can completely disable building of the python wrappers: You need to tell cmake where to find the boost libraries and header files: Your system has a version of boost installed in /usr/lib, but you would like to force the RDKit to use a more recent one. and is at the beginning of the PYTHONPATH: Project-Id-Version: The RDKit 2017.09
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-23 11:34+0000
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: ja
Language-Team: ja <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.3
 $ cd [anaconda folder]/bin $ source activate my-rdkit-env $ conda create -c rdkit -n my-rdkit-env rdkit $ source activate my-rdkit-env Add #define BOOST_PYTHON_NO_PY_SIGNATURES at the top of Code/GraphMol/Wrap/EditableMol.cpp Add this to the arguments when you call cmake: -DBoost_USE_STATIC_LIBS=OFF Additional Requirements Be sure that the new numpy is used in the build: Below a number of installation recipes is presented, with varying degree of complexity. Building Building on OS X with XCode 4 C:> activate my-rdkit-env Conda is an open-source, cross-platform, software package manager. It supports the packaging and distribution of software components, and manages their installation inside isolated execution environments. It has several analogies with pip and virtualenv, but it is designed to be more "python-agnostic" and more suitable for the distribution of binary packages and their dependencies. Creating a new conda environment with the RDKit installed using these  packages requires one single command similar to the following:: Due to the conda python distribution being a different version to the system python, it is easiest to install PostgreSQL and the PostgreSQL python client via conda. Eddie Cao has produced a homebrew formula that can be used to easily build the RDKit https://github.com/rdkit/homebrew-rdkit Fetch the source, here as tar.gz but you could use git as well: Finally, the new environment must be activated, so that the corresponding python interpreter becomes available in the same shell: For more details on building from source with Conda, see the conda-rdkit repository. For most use cases you will instead need to run PostgreSQL as a daemon, one way to do this is using supervisor. You can find out more and how to install supervisor here. The required configuration file will look something like this: Here things are more difficult. Check this wiki page for information: https://code.google.com/p/rdkit/wiki/BuildingOnCentOS Here's a sample command line: If for some reason this does not work, try: If you are trying to use multiple installations of PostgreSQL in different environments, you will need to setup different pid files, unix sockets and ports by editing the PostgreSQL config files. With the above configurations these files can be found in /folder/where/data/should/be/stored. If you aren't using the default python installation for your computer, You need to tell cmake where to find the python library it should link against and the python header files. If you have put boost in /opt/local, the cmake invocation would look like: If your linux distribution has a boost-devel package including the python, regex, threading, and serialization libraries, you can use that and save yourself the steps below. In Win7 systems, you may run into trouble due to missing DLLs, see one thread from the mailing list: http://www.mail-archive.com/rdkit-discuss@lists.sourceforge.net/msg01632.html You can download the missing DLLs from here: http://www.microsoft.com/en-us/download/details.aspx?id=5555 In each case I've replaced specific pieces of the path with .... Install the following packages using apt-get: Install the following packages using yum: More information here: http://www.mail-archive.com/rdkit-discuss@lists.sourceforge.net/msg01119.html More information here: http://www.mail-archive.com/rdkit-discuss@lists.sourceforge.net/msg01178.html Note that if you are using your own boost install on a system with a system install, it's normally a good idea to also include the argument -D Boost_NO_SYSTEM_PATHS=ON in your cmake command. Now it's safe to build boost and the RDKit. Once "make" and "make install" completed successfully, use the following command to run the tests: Once PostgreSQL is up and running, all of the normal PostgreSQL commands can then be run when your conda environment is activated. Therefore to create a database you can run: Optionally, add the following packages to your environment as useful development tools. Packages to install from source (not required on RHEL/CentOS 6.x): PostgreSQL can then be run from the terminal with the command: Problem: Problem: : See below for a list of FAQ and solutions. Solution: Solution: Get a copy of numpy and build it like this as root: as root: Thanks to Gianluca Sforna's work, binary RPMs for the RDKit are now part of the official Fedora repositories: https://admin.fedoraproject.org/pkgdb/package/rpms/rdkit/ Thanks to the efforts of the Debichem team, RDKit is available via the Ubuntu repositories. To install: The PYTHON_EXECUTABLE part is optional if the correct python is the first version in your PATH. The conda packages PostgreSQL version needs to be initialized by running the initdb command found in [conda folder]/envs/my-rdkit-env/bin The easiest way to get Conda is having it installed as part of the Anaconda Python distribution. A possible (but a bit more complex to use) alternative is provided with the smaller and more self-contained Miniconda. The conda source code repository is available on github and additional documentation is provided by the project website. The following commands will create a development environment for macOS Sierra and Python 3. Download Miniconda3-latest-MacOSX-x86_64.sh from Conda and run these following commands: The intent of this license is similar to that of the RDKit itself. In simple words: "Do whatever you want with it, but please give us some credit." The problem seems to be caused by the version of numpy that is distributed with XCode 4, so you need to build a fresh copy. Then follow the usual build instructions. The PYTHON_INCLUDE_DIR must be set in the cmake command. This can be solved by using cmake version 2.8.3 (or more recent) and providing the -D Boost_NO_SYSTEM_PATHS=ON argument: This document is copyright (C) 2012-2016 by Greg Landrum This is required due to the System Integrity Protection SIP introduced in more recent macOS versions. This section assumes that python is installed in C:\Python27, that the boost libraries have been installed to C:\boost, and that you will build the RDKit from a directory named C:\RDKit. If any of these conditions is not true, just change the corresponding paths. This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative Commons, 543 Howard Street, 5th Floor, San Francisco, California, 94105, USA. To use the wrappers, the three files need to be in the same directory, and that should be on your CLASSPATH and in the java.library.path. An example using jython: Using the wrappers Windows users will use a slightly different command: With your environment activated, this is done simply by: You can completely disable building of the python wrappers: You need to tell cmake where to find the boost libraries and header files: Your system has a version of boost installed in /usr/lib, but you would like to force the RDKit to use a more recent one. and is at the beginning of the PYTHONPATH: 