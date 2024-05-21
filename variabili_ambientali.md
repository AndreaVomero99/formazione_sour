# Enviroment Variables

Let's start by displaying all the currently active environment variables using the env command and piping the output to less for paging:

***env | less***

To highlight the PATH variable, we can use the grep command:

***env| grep PATH***

The PATH variable specifies the directories that the system searches to find executable commands dynamically. For example, the ls command is an external command, and its location can be verified using the whereis command:

***whereis ls ---> /usr/bin/ls***

This will typically show the path to the ls executable, such as /usr/bin/ls.

***type ls ---> "ls ha "ls --color=auto" come alias***

For example, the cd command will give a different result, as it is a built-in shell command and does not require external libraries to execute.


***type cd ---> cd is a shell builtin***

Let's print the variable

***echo $PATH ---> /usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:
/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:
/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:
/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin***

To add one or more directories to the PATH variable, execute the following command followed by the desired path:

***export PATH=$PATH:/daje/grande/roma/*** _This will add the specified directories without overwriting the existing ones._

If you want to restore the PATH variable to its original state, you can redefine it with the original output:

***export PATH=*** _Output of the first echo $PATH_

If you want to add an environment variable permanently to the disk, so it won't be erased after every reboot, you should do the following:

***vi .bashrc*** _Open the file with the vi editor_

Once inside the file, make the desired modification:

***export GATTO=Meow***  _Add the variable to the file, by convention, environment variables are uppercase._

Save the file, and once back in the shell, even after a reboot, you can print the result:


***echo $GATTO ---> Meow***






















