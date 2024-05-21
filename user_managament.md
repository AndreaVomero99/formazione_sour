# User and permissions management 

## Passwords and accounts setup

Let's start by setting a valid password expiration period. In this case, we want passwords to expire after 90 days with a 5-day warning.

We need to modify the following file:

#### sudo vi /etc/login.defs

Inside the file, set the values as follows:

#### PASS_MAX_DAYS 90
#### PASS_WARN_AGE 5

Now we can create users. Let's create a user named "utente1":

#### sudo useradd utente1

We can also set a password immediately using the -p option. In the event we skipped this option, we can fix it easily enough:

#### sudo passwd utente1

After the command, it will ask us to insert the password.

We will have to create each user individually since there is no "multiuseradd" option.

## Impostazione permessi

Now we can experiment a bit with permissions. Let's create a file using the touch command:

#### touch foo.log

We can specify that the file can only be read, modified, and executed by the owner, but we can still allow everyone to read it:

#### chmod 744 foo.log

Let's say we made a mistake and gave everyone execute permission as well. We solve the pickle this way:

#### chmod 745 foo.log 
#### chmod o-x foo.log

The second command removes the error from the previous command.

We can also change the owner and group of the file:

#### chown user:group foo.log

For example, if we want the user "pippo" as the owner and the group "foobar" (which we need to create first) as the group
 
#### sudo groupadd foobar
#### chown pippo:foobar foo.log

This way we can easily manage permissions.































