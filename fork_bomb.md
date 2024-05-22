# Fork bomb and its mitigation methods

## Down with the system!

Before creation comes destruction, let us crash the system using our fork bomb, we will need the following command

:(){ :|:& };:

This apparent gibberish does make sense:

: is the name of the function
(){ ... } instead defines the function
:|: invokes the function : and pipe (|) its way out of the function : With this trick, the function will get duplicated
& sends the process to the background, where it will prosecute its duplication
;: stops the function and calls it back immediately

Being a simple CLI command, a threat actor would be able to send a system to oblivion just by logging with SSH, without even needing administrative privileges

## Mitigation

Fate would have it that we actually can counter such an attack, either by using a command, or editing a specific file

### Command

We can use the following command to set a limit to the number of possible ongoing processes, for example, let's set it up to 100 processes

#### ulimit 100

Of course this would still severly hinder the workstation, saturating it with useless jobs, but a sysadmin may still try to solve the issue without having to reboot

### Editing

We can insert the following string inside the /etc/security/limits.conf

#### sudo echo "\* hard nproc 100"

This would yield the same result of the previous command























